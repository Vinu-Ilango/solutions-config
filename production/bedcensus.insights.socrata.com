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
      "name": "COVID-19 Hospital Data Submission Form",
      "link": "http://bedcensus.socrata.com/",
      "exploration_content": "COVID-19 Response"
    }
  ],
  "date": {
    "startDate": "2020-3-1"
  },
  "street_view_map_key": "AIzaSyB17sR2sKWfEcfsXwq_EKH4_J4DKuZ3y6I",
  "tag_list": [
    "Hospital Health",
    "Submission Tracking",
    "COVID-19 Spread"
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
      "dataset_id": "ep96-4dk4",
      "notes_dataset_id": "8tv7-b3ra",
      "notes_dataset_join_column": "hospital_id",
      "parent_dataset_join_column": "facility_id",
      "parent_queries": [],
      "fields": {
        "date_column": "last_updated_ts",
        "incident_type": "responded_in_last_day",
        "location": "location",
        "mquc-phjc": ":@computed_region_mquc_phjc",
        "ctwz-r3ic": ":@computed_region_ctwz_r3ic",
        "mpe2-7au2": ":@computed_region_mpe2_7au2"
      },
      "dimension_entries": [
        {
          "column": "hospital_type",
          "name": "Hospital Type"
        },
        {
          "column": "state",
          "name": "State"
        },
        {
          "column": "hospital_ownership",
          "name": "Ownership"
        },
        {
          "column": "provider_organization_name",
          "name": "Organization"
        }
      ],
      "group_by_entries": [
        {
          "column": "responded_in_last_day",
          "name": "Responded in Last Day"
        },
        {
          "column": "responded_in_last_three_days",
          "name": "Responded in Last 3 Days"
        },
        {
          "column": "emergency_services",
          "name": "Has Emergency Services"
        },
        {
          "column": "hospital_type",
          "name": "Hospital Type"
        }
      ],
      "view_entries": [
        {
          "name": "Hospitals Missing Reports",
          "primary_metric name": "Hospitals Missiing Reports",
          "parent_queries": [
            "select :*,* where last_updated_ts is null"
          ],
          "column": "facility_id",
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
          "primary_metric name": "Hospitals Reporting At Least Once",
          "column": "facility_id",
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
          "column": "facility_id",
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
          "name": "% of Hospitals Submitting - Last 24 Hours",
          "primary_metric name": "Data Submission - Last 24 Hours",
          "column": "100*(sum(case(date_diff_d({TODAY}, last_updated_ts) <= 1, 1, true, 0))/count(facility_id))",
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
          "column": "100*(sum(case(date_diff_d({TODAY}, last_updated_ts) <= 2, 1, true, 0))/count(facility_id))",
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
          "column": "100*(sum(case(date_diff_d({TODAY}, last_updated_ts) <= 3, 1, true, 0))/count(facility_id))",
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
          "name": "Has Emergency Services",
          "column": "emergency_services"
        },
        {
          "name": "National Mortality Comparison",
          "column": "mortality_national_comparison"
        },
        {
          "name": "Medical Services Efficiency",
          "column": "efficient_use_of_medical"
        },
        {
          "name": "Last Updated",
          "column": "last_updated_ts"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "facility_id",
          "name": "Facility ID"
        },
        {
          "column": "facility_name",
          "name": "Facility Name"
        },
        {
          "column": "address",
          "name": "Address"
        },
        {
          "column": "city",
          "name": "City"
        },
        {
          "column": "state",
          "name": "State"
        },
        {
          "column": "hospital_type",
          "name": "Hospital Type"
        },
        {
          "column": "hospital_ownership",
          "name": "Hospital Ownership"
        },
        {
          "column": "user_id",
          "name": "Updating User ID"
        },
        {
          "column": "phone_number",
          "name": "Updating User Phone Number"
        },
        {
          "column": "last_updated_ts",
          "name": "Last Updated Time"
        },
        {
          "column": "hospital_phone_number",
          "name": "Authorized Phone Number"
        }
      ],
      "quick_filter_entries": [
        {
          "name": "Adult Critical Care COVID Cases",
          "column": "adult_critical_care_covid",
          "renderType": "number"
        },
        {
          "name": "General Acute COVID Cases",
          "column": "general_acute_covid",
          "renderType": "number"
        },
        {
          "name": "Sub Acute COVID Cases",
          "column": "sub_acute_covid",
          "renderType": "number"
        },
        {
          "name": "Last Called",
          "column": "notes_last_called",
          "renderType": "date"
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
      "dataset_id": "ui9r-vggn",
      "fields": {
        "date_column": "date",
        "incident_type": "type",
        "location": "geolocation",
        "mquc-phjc": ":@computed_region_mquc_phjc"
      },
      "dimension_entries": [
        {
          "column": "country_region",
          "name": "Country"
        },
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
          "name": "Global Confirmed COVID Cases",
          "primary_metric name": "Global COVID Cases",
          "parent_queries": [
            "select :*, * WHERE type='Confirmed'"
          ],
          "column": "cases",
          "start_date_override_and_ignore": "true",
          "aggregate_type": "sum",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "tags": [
            "COVID-19 Spread"
          ],
          "visualization": {
            "default_view": "overtime",
            "map": {
              "default_view": "choropleth"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "default_view": "burn_up"
            }
          }
        },
        {
          "name": "US Confirmed COVID Cases",
          "primary_metric name": "US COVID Cases",
          "parent_queries": [
            "select :*, * WHERE country_region='US' and type='Confirmed'"
          ],
          "column": "cases",
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
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "default_view": "burn_up"
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
