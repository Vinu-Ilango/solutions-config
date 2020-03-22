{
  "application_use": "live",
  "solutions_app_users": ["*@elumitas.com", "*@tylertech.com", "*@socrata.com"],
  "allow_leaf_page_from_table":"true",
  "branding": {
    "browser_title": "COVID-19 Response",
    "title": "COVID-19 Response",
    "delimiter": ","
  },
  "exploration_card_entries": [
    {
      "name": "COVID-19 Hospital Data Submission Tracker",
      "link": "covid-19-beds.projects.socrata.com",
      "exploration_content": "COVID-19 Response"
    },
    {
      "name": "COVID-19 Hospital Beds Census",
      "link": "covid-19-beds.projects.socrata.com",
      "exploration_content": "COVID-19 Response"
    }
  ],
  "date": {
    "startDate": "2020-3-1"
  },
  "street_view_map_key": "AIzaSyB17sR2sKWfEcfsXwq_EKH4_J4DKuZ3y6I",
  "tag_list": [
    "Beds & Occupancy",
    "Ventilator Access",
    "Data Quality"
  ],
  "template_entries": [
    {
      "name": "COVID-19 Response",
      "description": "",
      "dataset_domain": "elumitas.test-socrata.com",
      "dataset_id": "99hv-bkmr",
      "notes_dataset_id": "q9jh-eg7s",
      "notes_dataset_join_column": "hospital_id",
      "parent_dataset_join_column": "npi",
      "parent_queries": [],
      "fields": {
        "date_column": "last_updated_ts",
        "incident_type": "classification",
        "location": "geocoded_column",
        "mquc-phjc": ":@computed_region_mquc_phjc",
        "ctwz-r3ic": ":@computed_region_ctwz_r3ic",
        "mpe2-7au2": ":@computed_region_mpe2_7au2"
      },
      "dimension_entries": [
        {
          "column": "classification",
          "name": "Classification"
        },
        {
          "column": "provider_organization_name",
          "name": "Organisation"
        },
        {
          "column": "provider_business_mailing_1",
          "name": "State"
        }
      ],
      "view_entries": [
        {
          "name": "Hospitals Missing Reports",
          "primary_metric name": "Hospitals",
          "parent_queries": [
              "select * where last_updated_ts is null"
              ],
          "column": "npi",
          "start_date_override_and_ignore": "true",
          "end_date_override_and_ignore": "true",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [],
          "visualization": {
            "default_view": "map",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals Reporting",
          "primary_metric name": "Hospitals",
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [],
          "visualization": {
            "default_view": "map",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals with GREEN Occupancy Health",
          "primary_metric name": "Hospitals with green occupancy",
          "parent_queries": [
            "select * where occupancy_health = '1'"
          ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Beds & Occupancy"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals with YELLOW Occupancy Health",
          "primary_metric name": "Hospitals with yellow occupancy",
          "parent_queries": [
            "select * where occupancy_health = '2'"
          ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Beds & Occupancy"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals with RED Occupancy Health",
          "primary_metric name": "Hospitals with red occupancy",
          "parent_queries": [
            "select * where occupancy_health = '3'"
          ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Beds & Occupancy"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of hospitals with GREEN Occupancy Health",
          "primary_metric name": "Hospitals with green occupancy health",
          "column": "(sum(case(occupancy_health == 1, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Beds & Occupancy"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of hospitals with YELLOW Occupancy Health",
          "primary_metric name": "Hospitals with occupancy ventilator health",
          "column": "(sum(case(occupancy_health == 2, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Beds & Occupancy"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of hospitals with RED Occupancy Health",
          "primary_metric name": "Hospitals with red occupancy health",
          "column": "(sum(case(occupancy_health == 3, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Beds & Occupancy"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals with GREEN Ventilator Health",
          "primary_metric name": "Hospitals with red ventilator health",
          "parent_queries": [
            "select * where ventilators_use_health = '1'"
          ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Ventilator Access"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals with YELLOW Ventilator Health",
          "primary_metric name": "Hospitals with red ventilator health",
          "parent_queries": [
            "select * where ventilators_use_health = '2'"
          ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Ventilator Access"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals with RED Ventilator Health",
          "primary_metric name": "Hospitals with red ventilator health",
          "parent_queries": [
            "select * where ventilators_use_health = '3'"
          ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Ventilator Access"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of hospitals with GREEN Ventilator Health",
          "primary_metric name": "Hospitals with green ventilator health",
          "column": "(sum(case(ventilators_use_health == 1, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Ventilator Access"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of hospitals with YELLOW Ventilator Health",
          "primary_metric name": "Hospitals with yellow ventilator health",
          "column": "(sum(case(ventilators_use_health == 2, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Ventilator Access"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of hospitals with RED Ventilator Health",
          "primary_metric name": "Hospitals with red ventilator health",
          "column": "(sum(case(ventilators_use_health == 3, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Ventilator Access"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of Hospitals Submitting Within 24 Hours",
          "primary_metric name": "Data Submission - Last 24 Hours",
          "column": "(sum(case(date_diff_d(today, last_updated_ts) <= 1, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Data Quality"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of Hospitals Submitting Within 48 Hours",
          "primary_metric name": "Data Submission - Last 24 Hours",
          "column": "(sum(case(date_diff_d(today, last_updated_ts) <= 2, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Data Quality"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of Hospitals Submitting Within 72 Hours",
          "primary_metric name": "Data Submission - Last 24 Hours",
          "column": "(sum(case(date_diff_d(today, last_updated_ts) <= 3, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Data Quality"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals that have reported cases in the last 72 hours",
          "primary_metric name": "Cases reported - last 72 hours",
          "parent_queries": [
          ],
          "column": "sum(case(case_reported_72_hours = true, 1, true, 0))",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of hospitals that have reported cases in the last 72 hours",
          "primary_metric name": "Cases reported - last 72 hours",
          "parent_queries": [
          ],
          "column": "(sum(case(case_reported_72_hours = true, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals that have not reported cases in the last 72 hours",
          "primary_metric name": "Cases not reported - last 72 hours",
          "parent_queries": [
          ],
          "column": "sum(case(case_reported_72_hours = false, 1, true, 0))",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of hospitals that have not reported cases in the last 72 hours",
          "primary_metric name": "Cases not reported - last 72 hours",
          "parent_queries": [
          ],
          "column": "(sum(case(case_reported_72_hours = false, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        }
      ],
      "filter_by_entries": [
        {
          "name": "Assignee",
          "column": "notes_assignee"
        }

      ],
      "leaf_page_entries": [
        {
          "column": "classification",
          "name": "Classification"
        },
        {
          "column": "provider_organization_name",
          "name": "Organisation"
        },
        {
          "column": "provider_business_mailing_1",
          "name": "State"
        }
      ],
      "quick_filter_entries": [
        {
          "name": "Noted Assignee",
          "column": "notes_assignee",
          "renderType": "text"
        }   
      ],
      "map": {
        "centerLat": "34.263423913021555",
        "centerLng": "-90.42980668901862",
        "zoom": "3.2",
        "mini_map_zoom": "2.5",
        "shapes_outline_highlight_width": "2",
        "shapes_outline_width": "1.5",
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
          "shape_dataset_domain": "covid-19-response.demo.socrata.com",
          "shape_dataset_id": "mquc-phjc",
          "shape_name": "US States",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "name",
            "shape_description": "name"
          },
          "color": "#add8e6"
        },
        {
          "shape_dataset_domain": "covid-19-response.demo.socrata.com",
          "shape_dataset_id": "ctwz-r3ic",
          "shape_name": "Counties",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "name",
            "shape_description": "name"
          },
          "color": "#add8e6"
        },
        {
          "shape_dataset_domain": "covid-19-response.demo.socrata.com",
          "shape_dataset_id": "mpe2-7au2",
          "shape_name": "New Jersey Census",
          "fields": {
            "shape": "multipolygon",
            "shape_id": "_feature_id",
            "shape_name": "name",
            "shape_description": "name"
          },
          "color": "#add8e6"
        }
      ]
    }
  ]
}
