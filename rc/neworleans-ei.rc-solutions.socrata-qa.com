{
  "branding": {
    "browser_title": "New Orleans Executive Insights",
    "title": "New Orleans Executive Insights"
  },
  "tag_list": [
    "Permitting",
    "Inspections"
  ],
  "date": {
    "startDate": "2018-1-1",
    "endDate": "2020-01-27"
  },
  "show_share_via_email": true,
  "is_private": "false",
  "template_entries": [{
      "name": "Permitting",
      "description": "Permitting",
      "dataset_domain": "neworleans-ei.data.socrata.com",
      "dataset_id": "55ss-q7m6",
      "fields": {
        "date_column": "filingdate",
        "incident_type": "type",
        "location": "geocoded_column",
        "bve8-xnew": ":@computed_region_bve8_xnew"
      },
      "dimension_entries": [{
          "column": "type",
          "name": "Permit Type"
        },
        {
          "column": "councildist",
          "name": "Council District"
        },
        {
          "column": "currentstatus",
          "name": "Permit Status"
        }
      ],
      "group_by_entries": [{
          "column": "type",
          "name": "Permit Type"
        },
        {
          "column": "councildist",
          "name": "Council District"
        },
        {
          "column": "currentstatus",
          "name": "Permit Status"
        }
      ],
      "view_entries": [{
          "name": "Permits Issued",
          "column": "numstring",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "permits",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "fields": {
            "date_column": "issuedate"
          }
        },
        {
          "name": "Total Applications Received",
          "column": "numstring",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "groupChart"
            },
            "overtime": {
              "timeline": {
                "default_time_frame": "year_on_year"
              }
            }
          },
          "fields": {
            "date_column": "filingdate"
          }
        },
        {
          "name": "Open Permit Applications",
          "column": "numstring",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "end_date_override_and_ignore": "true",
          "start_date_boolean_override": "<",
          "parent_queries": [
            "select *,:@computed_region_bve8_xnew where currentstatus in ('Application Review', 'Plan Review', 'Application Deficiencies', 'Inspection Required')"
          ],
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Permits issued Within 30 days",
          "column": "((sum(less_than_30_count)/count(*))::double)*100.00",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot",
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [{
                  "column": "numstring",
                  "name": "Number of Permits",
                  "aggregate_type": "count",
                  "prefix": "",
                  "suffix": "",
                  "precision": "0",
                  "render_type": "bullet"
                }],
                "bench_mark_entries": [{
                  "name": "90%",
                  "value": "90"
                }]
              },
              "scatterplot": {
                "default_show_range": "false",
                "secondary_metric_entries": [{
                  "column": "numstring",
                  "name": "Number of Permits",
                  "aggregate_type": "count",
                  "precision": "",
                  "prefix": "",
                  "suffix": ""
                }]
              }
            }
          },
          "fields": {
            "date_column": "filingdate"
          },
          "parent_queries": [
            "select *, :@computed_region_bve8_xnew,case(applied_to_issued < 30, 1) as less_than_30_count where applied_to_issued is not null"
          ],
          "target_entries": [{
              "name": "SLA Met",
              "color": "#259652",
              "operator": ">",
              "value": "90",
              "icon": "icons-check-circle",
              "target_entry_description": "The SLA for this operating metric is being met. The SLA is 90% of permits issued within 30 days."
            },
            {
              "name": "SLA Not Met",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "The SLA for this operating metric is not being met. The SLA is 90% of permits issued within 30 days."
            }
          ]
        },
        {
          "name": "Average # Days from Application to Issuance",
          "column": "avg(applied_to_issued)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": " days",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "target_entries": [{
              "name": "SLA Met",
              "color": "#259652",
              "operator": "<",
              "value": "120",
              "icon": "icons-check-circle"
            },
            {
              "name": "SLA Not Met",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Total Estimated Value of Permitted Construction",
          "column": "sum(constrval)",
          "aggregate_type": "",
          "use_dimension_value": "",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "leaf_page_entries": [
      ],
      "map": {
        "centerLat": "34.196895,",
        "centerLng": "-77.876867",
        "zoom": "9",
        "mini_map_zoom": "9",
        "shapes_outline_highlight_width": "4",
        "style_entries": [{
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
      "shape_dataset_entries": [{
        "shape_dataset_domain": "neworleans-ei.data.socrata.com",
        "shape_dataset_id": "bve8-xnew",
        "shape_name": "New Orleans Neighborhood Statistical Areas",
        "fields": {
          "shape": "the_geom",
          "shape_id": "_feature_id",
          "shape_name": "gnocdc_lab"
        },
        "color": "#32a889",
        "border_color": "#cccccc",
        "mini_map_border_color": "#4d4e4f",
        "outline_highlight_color": "#808080"
      }]
    }
  ]
}
