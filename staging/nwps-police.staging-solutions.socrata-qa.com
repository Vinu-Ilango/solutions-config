{
  "branding": {
    "browser_title": "Public Safety Insights",
    "title": "Executive Insights"
  },
  "exploration_card_entries": [
    {
      "name": "Courts and Justice",
      "link": "courtsandjustice.demo.socrata.com",
      "image": "https://www.tylertech.com/Portals/0/Images/Products/ODYSSEY-Courts-Justice-Solution.jpg?ver=2018-09-19-115543-363?format=jpg&quality=80",
      "exploration_content": "Court Operations"
    }
  ],
  "tag_list": [
    "Arrests"
  ],
  "date": {
    "startDate": "2019-1-1",
    "endDate": "2019-12-31"
  },
  "template_entries": [
    {
      "name": "Arrests",
      "description": "",
      "dataset_domain": "pinellasparkpd.data.socrata.com",
      "dataset_id": "2rrd-f7ie",
      "fields": {
        "date_column": "arrest_date_time",
        "incident_type": "arrest_result_of",
        "location": "location",
        "ntia-f3vs": ":@computed_region_ntia-f3vs"
      },
      "dimension_entries": [
        {
          "column": "arrestee_race",
          "name": "Arrestee Race"
        },
        {
          "column": "arrest_result_of",
          "name": "Arrest Result Of"
        },
        {
          "column": "assigned_bureau",
          "name": "Bureau"
        },
        {
          "column": "resident_type",
          "name": "Resident Type"
        },
        {
          "column": "resident_status",
          "name": "Resident Status"
        }
      ],
      "group_by_entries": [
        {
          "column": "is_juvenile_arrest",
          "name": "Juvenile Arrest"
        },
        {
          "column": "arrest_status",
          "name": "Arrest Status"
        }
      ],
      "view_entries": [
        {
          "name": "Number of Arrests",
          "column": "arrest_id",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Arrests"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "bench_mark_entries": []
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_burnup_chart": "true",
              "timeline": {
                "default_view": "burnup"
              }
            }
          }
        }
      ],
      "filter_by_entries": [],
      "leaf_page_entries": [
        {
          "column": "arrest_number",
          "name": "Arrest Number"
        },
        {
          "column": "arrest_result_of",
          "name": "Arrest Result Of"
        },
        {
          "column": "arrest_date_time",
          "name": "Arrest Date"
        },
        {
          "column": "arrest_status",
          "name": "Arrest Status"
        }
      ],
      "quick_filter_entries": [],
      "map": {
        "centerLat": "27.857590",
        "centerLng": "-82.711240",
        "zoom": "12",
        "mini_map_zoom": "12",
        "shapes_outline_highlight_width": "1",
        "shapes_outline_width": "0.5",
        "style_entries": [
          {
            "name": "Street",
            "style": "mapbox://styles/mapbox/streets-v10"
          },
          {
            "name": "Light",
            "style": "mapbox://styles/mapbox/light-v9"
          },
          {
            "name": "Dark",
            "style": "mapbox://styles/mapbox/dark-v9"
          },
          {
            "name": "Satelite",
            "style": "mapbox://styles/mapbox/satellite-v9"
          },
          {
            "name": "Outdoors",
            "style": "mapbox://styles/mapbox/outdoors-v10"
          }
        ]
      },
      "shape_dataset_entries": [
        {
          "shape_dataset_domain": "pinellasparkpd.data.socrata.com",
          "shape_dataset_id": "ntia-f3vs",
          "shape_name": "Districts",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "name",
            "shape_description": "affgeoid"
          },
          "color": "#32a889",
          "border_color": "#cccccc",
          "mini_map_border_color": "#4d4e4f",
          "outline_highlight_color": "#808080"
        }
      ],
      "shape_outline_dataset_entries": []
    }
  ]
}
