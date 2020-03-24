{
  "application_use": "live",
  "is_private": "false",
  "solutions_app_users": [
    "*@elumitas.com",
    "*@tylertech.com",
    "*@socrata.com"
  ],
  "allow_leaf_page_from_table": "true",
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
    "Hospital Health",
    "Submission Tracking"
  ],
  "template_entries": [
    {
      "name": "Notes & Assignments",
      "description": "",
      "dataset_domain": "covid-19-response.demo.socrata.com",
      "dataset_id": "8tv7-b3ra",
      "fields": {
        "date_column": "last_called"
      },
      "dimension_entries": [
        {
          "column": "assignee",
          "name": "Assignee"
        },
        {
          "column": "hospital_id",
          "name": "Hospital ID"
        }
      ],
      "view_entries": [
        {
          "name": "Hospitals Called",
          "primary_metric name": "Hospitals Called",
          "column": "hospital_id",
          "start_date_override_and_ignore": "true",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Submission Tracking"
          ],
          "visualization": {
            "default_view": "table"
          }
        }
      ],
      "filter_by_entries": [
        {
          "name": "Assignee",
          "column": "assignee"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "hospital_id",
          "name": "Hospital ID"
        },
        {
          "column": "assignee",
          "name": "Assignee"
        },
        {
          "column": "message",
          "name": "Notes"
        },
        {
          "column": "last_called",
          "name": "Last Called"
        }
      ]
    },
    {
      "name": "COVID-19 Response",
      "description": "",
      "dataset_domain": "covid-19-response.demo.socrata.com",
      "dataset_id": "6ide-cs9c",
      "notes_dataset_id": "8tv7-b3ra",
      "notes_dataset_join_column": "hospital_id",
      "parent_dataset_join_column": "npi",
      "history_dataset_id": "pkmh-2b7j",
      "history_dataset_join_column": "hospital_id",
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
            "select :*,* where last_updated_ts is null"
          ],
          "column": "npi",
          "start_date_override_and_ignore": "true",
          "end_date_override_and_ignore": "true",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Submission Tracking"
          ],
          "visualization": {
            "default_view": "map",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals Reporting At Least Once in Period",
          "primary_metric name": "Hospitals",
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Submission Tracking"
          ],
          "visualization": {
            "default_view": "map",
            "snapshot": {}
          }
        },
        {
          "name": "Hospitals Reporting At Least Once in Period",
          "primary_metric name": "Hospitals",
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Submission Tracking"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {}
          }
        },
        {
          "name": "Submitting Hospitals with Low Reported Occupancy",
          "primary_metric name": "Hospitals with low occupancy",
          "parent_queries": [
            "select :*,* where occupancy_health = '1'"
          ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Hospital Health"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "Submitting Hospitals with Medium Reported Occupancy",
          "primary_metric name": "Hospitals with medium occupancy",
          "parent_queries": [
            "select :*,* where occupancy_health = '2'"
          ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Hospital Health"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "Submitting Hospitals with High Reported Occupancy",
          "primary_metric name": "Hospitals with High occupancy",
          "parent_queries": [
            "select :*,* where occupancy_health = '3'"
          ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
            "Hospital Health"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of Submitting Hospitals with Low Reported Occupancy",
          "primary_metric name": "% of Hospitals with low occupancy",
          "column": "(sum(case(occupancy_health == 1, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Hospital Health"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of Submitting Hospitals with Medium Reported Occupancy",
          "primary_metric name": "% of Hospitals with medium occupancy",
          "column": "(sum(case(occupancy_health == 2, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Hospital Health"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of Submitting Hospitals with High Reported Occupancy",
          "primary_metric name": "Hospitals with high reported occupancy",
          "column": "(sum(case(occupancy_health == 3, 1, true, 0))/count(npi))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Hospital Health"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of Hospitals Submitting - Last 24 Hours",
          "primary_metric name": "Data Submission - Last 24 Hours",
          "column": "100*(sum(case(date_diff_d({TODAY}, last_updated_ts) <= 1, 1, true, 0))/count(npi))",
          "start_date_override_and_ignore": "true",
          "end_date_override_and_ignore": "true",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Submission Tracking"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of Hospitals Submitting - Last 48 Hours",
          "primary_metric name": "Data Submission - Last 48 Hours",
          "column": "100*(sum(case(date_diff_d({TODAY}, last_updated_ts) <= 2, 1, true, 0))/count(npi))",
          "start_date_override_and_ignore": "true",
          "end_date_override_and_ignore": "true",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Submission Tracking"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {}
          }
        },
        {
          "name": "% of Hospitals Submitting - Last 72 Hours",
          "primary_metric name": "% Hospitals Submitting - Last 72 Hours",
          "column": "100*(sum(case(date_diff_d({TODAY}, last_updated_ts) <= 3, 1, true, 0))/count(npi))",
          "start_date_override_and_ignore": "true",
          "end_date_override_and_ignore": "true",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Submission Tracking"
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
        },
        {
          "name": "Entity Type Code",
          "column": "entity_type_code"
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
        },
        {
          "column": "last_updated_ts",
          "name": "Last Submission"
        },
        {
          "column": "last_updated_ts",
          "name": "Last Submission"
        },
        {
          "column": "last_updated_ts",
          "name": "Last Submission"
        },
        {
          "column": "user_id",
          "name": "Updating User ID"
        },
        {
          "column": "full_name",
          "name": "Authorized User Name"
        },
        {
          "column": "authorized_official_telephone",
          "name": "Authorized Phone Number"
        }
      ],
      "quick_filter_entries": [
        {
          "name": "Noted Assignee",
          "column": "notes_assignee",
          "renderType": "text"
        },
        {
          "name": "Total Bed Capacity",
          "column": "total_bed_capacity",
          "renderType": "number"
        },
        {
          "name": "Total CC Bed Capacity",
          "column": "total_bed_capacity_cc",
          "renderType": "number"
        },
        {
          "name": "Last Called",
          "column": "notes_last_called",
          "renderType": "date"
        }
      ],
      "flyout_entries": [
        {
          "column": "provider_organization_name",
          "name": "Organisation",
          "render_type": "text"
        }, 
        {
          "column": "classification",
          "name": "Classification",
          "render_type": "text"
        },
        {
          "column": "npi",
          "name": "Hospital ID",
          "render_type": "number"
        },
        {
          "name": "Noted Assignee",
          "column": "notes_assignee",
          "render_type": "text"
        },
        {
          "name": "Last Called",
          "column": "notes_last_called",
          "render_type": "date"
        },
        {
          "name": "Notes",
          "column": "notes_message",
          "render_type": "text"
        }
      ],
      "table_column_entries": [
        {
          "column": "npi",
          "name": "Hospital ID",
          "render_type": "number"
        },
                {
          "column": "classification",
          "name": "Classification",
          "render_type": "text"
        },
        {
          "column": "provider_organization_name",
          "name": "Organisation",
          "render_type": "text"
        },
        {
          "column": "provider_business_mailing_1",
          "name": "State",
          "render_type": "text"
        },
        {
          "column": "last_updated_ts",
          "name": "Last Submission",
          "render_type": "date"
        },
        {
          "column": "full_name",
          "name": "Authorized User Name",
          "render_type": "text"
        },
        {
          "column": "authorized_official_telephone",
          "name": "Authorized Phone Number",
          "render_type": "number"
        },
        {
          "name": "Noted Assignee",
          "column": "notes_assignee",
          "render_type": "text"
        },
        {
          "name": "Last Called",
          "column": "notes_last_called",
          "render_type": "date"
        },
        {
          "name": "Notes",
          "column": "notes_message",
          "render_type": "text"
        }
      ],
      "map": {
        "centerLat": "38.86977135801689",
        "centerLng": "-95.70921977321967",
        "zoom": "3.2",
        "mini_map_zoom": "1.8",
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
    },
    {
      "name": "COVID-19 Spread",
      "description": "",
      "dataset_domain": "covid-19-response.demo.socrata.com",
      "dataset_id": "e2g5-hvty",
      "fields": {
        "date_column": "date",
        "incident_type": "type",
        "location": "geocoded_column",
        "mquc-phjc": ":@computed_region_mquc_phjc"
      },
      "dimension_entries": [
        {
          "column": "province_state",
          "name": "Province or State"
        },
        {
          "column": "type",
          "name": "type"
        }
      ],
      "view_entries": [
        {
          "name": "US Confirmed COVID Cases",
          "primary_metric name": "US COVID Cases",
          "parent_queries": [
            "select :*, * WHERE country_region='US'"
          ],
          "column": "delta",
          "aggregate_type": "sum",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "tags": [
            "COVID-19 Spread"
          ],
          "visualization": {
            "default_view": "map",
            "map": {
              "default_view": "choropleth"
            },
            "overtime": {
              "show_area_chart": "true"
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "name": "Country",
          "column": "country_region"
        },
        {
          "name": "Type",
          "column": "type"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "country_region",
          "name": "Country or Region"
        },
        {
          "column": "province_state",
          "name": "Province or State"
        },
        {
          "column": "type",
          "name": "Type"
        },
        {
          "column": "date",
          "name": "Date"
        },
        {
          "column": "count",
          "name": "Count"
        }
      ],
      "map": {
        "centerLat": "38.86977135801689",
        "centerLng": "-95.70921977321967",
        "zoom": "3.2",
        "mini_map_zoom": "1.8",
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
        }
      ],
      "shape_outline_dataset_entries": []
    }
  ]
}
