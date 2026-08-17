
import json
import os
import sys
from typing import List, Dict, Any

# Add app-store-optimization to path
sys.path.append(os.path.join(os.getcwd(), 'app-store-optimization'))

from lib.itunes_api import iTunesAPI
from competitor_analyzer import CompetitorAnalyzer
from keyword_analyzer import KeywordAnalyzer

def research_foodie():
    print("Starting Foodie App Research...")
    api = iTunesAPI()
    comp_analyzer = CompetitorAnalyzer(category="Food & Drink")
    kw_analyzer = KeywordAnalyzer()
    
    search_terms = ["foodie", "restaurant finder", "food delivery", "recipe", "food photography"]
    all_apps = {}
    
    for term in search_terms:
        print(f"Searching for '{term}'...")
        results = api.search_apps(term, limit=10)
        for app in results.get('results', []):
            app_id = app.get('trackId')
            if app_id not in all_apps:
                all_apps[app_id] = api.extract_metadata(app)
    
    print(f"Found {len(all_apps)} unique apps. Analyzing top 15 by ratings count...")
    
    # Sort by ratings count to get the most popular ones
    sorted_apps = sorted(all_apps.values(), key=lambda x: x.get('ratings_count', 0), reverse=True)
    top_apps = sorted_apps[:15]
    
    # Save raw data
    os.makedirs('outputs/foodie/01-research/raw-data', exist_ok=True)
    with open('outputs/foodie/01-research/raw-data/competitors_raw.json', 'w') as f:
        json.dump(top_apps, f, indent=2)
    
    # Analyze competitors
    print("Running competitor analysis...")
    comp_data = []
    for app in top_apps:
        # Extract keywords from title and description for the analyzer
        found_kws = kw_analyzer.extract_keywords_from_text(f"{app['app_name']} {app['description']}")
        kw_list = [kw[0] for kw in found_kws[:10]]
        
        comp_data.append({
            'app_name': app['app_name'],
            'title': app['app_name'],
            'description': app['description'],
            'rating': app['rating'],
            'ratings_count': app['ratings_count'],
            'keywords': kw_list
        })
    
    comp_analysis = comp_analyzer.compare_competitors(comp_data)
    
    with open('outputs/foodie/01-research/raw-data/competitor_analysis.json', 'w') as f:
        json.dump(comp_analysis, f, indent=2)
    
    # Analyze keywords
    print("Running keyword analysis...")
    all_text = " ".join([app['description'] for app in top_apps])
    extracted_kws = kw_analyzer.extract_keywords_from_text(all_text)
    
    kw_input_data = []
    for kw, freq in extracted_kws[:30]:
        # Estimate search volume based on frequency and total ratings of apps mentioning it
        # This is a very rough proxy
        volume = freq * 1000 
        competing = freq * 5
        
        kw_input_data.append({
            'keyword': kw,
            'search_volume': volume,
            'competing_apps': competing,
            'relevance_score': 0.8 if any(term in kw for term in ["food", "restaurant", "recipe", "delivery"]) else 0.5
        })
    
    kw_comparison = kw_analyzer.compare_keywords(kw_input_data)
    
    with open('outputs/foodie/01-research/raw-data/keyword_analysis.json', 'w') as f:
        json.dump(kw_comparison, f, indent=2)
        
    # Generate Markdown Reports
    print("Generating reports...")
    generate_keyword_list(kw_comparison)
    generate_competitor_gaps(comp_analysis)
    generate_action_research()
    
    print("Research complete! Files generated in outputs/foodie/01-research/")

def generate_keyword_list(kw_comparison):
    with open('outputs/foodie/01-research/keyword-list.md', 'w') as f:
        f.write("# Keyword Research - Foodie App\n\n")
        f.write("## Primary Keywords (Use in Title)\n")
        for kw in kw_comparison['primary_keywords']:
            f.write(f"1. **{kw['keyword']}** (potential: {kw['potential_score']}, difficulty: {kw['difficulty_score']})\n")
            f.write(f"   - Recommendation: {kw['recommendation']}\n")
        
        f.write("\n## Secondary Keywords (Use in Description)\n")
        for kw in kw_comparison['secondary_keywords']:
            f.write(f"- {kw['keyword']} (potential: {kw['potential_score']})\n")
            
        f.write("\n## Long-Tail Keywords\n")
        for kw in kw_comparison['long_tail_keywords']:
            f.write(f"- {kw['keyword']}\n")

def generate_competitor_gaps(comp_analysis):
    with open('outputs/foodie/01-research/competitor-gaps.md', 'w') as f:
        f.write("# Competitor Intelligence - Foodie App\n\n")
        f.write("## Top Competitors Analyzed\n")
        for comp in comp_analysis['ranked_competitors'][:5]:
            f.write(f"### {comp['app_name']}\n")
            f.write(f"- Rating: {comp['rating_metrics']['rating']}★ ({comp['rating_metrics']['ratings_count']:,} ratings)\n")
            f.write(f"- Strategy: {comp['title_analysis']['strategy']}\n")
            f.write(f"- Strength: {comp['competitive_strength']:.2f}\n\n")
            
        f.write("## Keyword Gaps (Opportunities)\n")
        for gap in comp_analysis['keyword_gaps'][:10]:
            f.write(f"- **{gap}**\n")
            
        f.write("\n## Best Practices Identified\n")
        for practice in comp_analysis['best_practices']:
            f.write(f"- {practice}\n")
            
        f.write("\n## Opportunities\n")
        for opt in comp_analysis['opportunities']:
            f.write(f"- {opt}\n")

def generate_action_research():
    with open('outputs/foodie/01-research/action-research.md', 'w') as f:
        f.write("# Research Action Checklist - Foodie App\n\n")
        f.write("## Phase 1: Review Research\n")
        f.write("- [ ] Review top 5 primary keywords\n")
        f.write("- [ ] Analyze competitor title strategies\n")
        f.write("## Phase 2: Implementation Planning\n")
        f.write("- [ ] Select title keyword from primary list\n")
        f.write("- [ ] Draft subtitle with secondary keywords\n")
        f.write("- [ ] Plan 100-character keyword field\n")

if __name__ == "__main__":
    research_foodie()
