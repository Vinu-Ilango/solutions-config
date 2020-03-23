{
  "branding": {
    "browser_title": "Solutions | QA ",
    "title": "Solutions - QA"
  },
  "tag_list": [
    "Cases",
    "Judges",
    "Clearence rates",
    "Districts and counties"
  ],
  "show_share_via_email": "false",
  "is_private": "false",
  "solutions_app_users": [
  ],
  "date": {
    "startDate": "2019-10-01",
    "endDate": "2019-12-31"
  },
  "date_options": {
    "type": "yearly",
    "year_start_month": "4",
    "data_end_date": "2020-02-10"
  },
  "template_entries": [
    {
      "name": "Opex Budget",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "s8xp-hq5q",
      "fields": {},
      "dimension_entries": [
        {
          "column": "service",
          "name": "Service"
        },
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "program",
          "name": "Program"
        },
        {
          "column": "category",
          "name": "Category"
        }
      ],
      "view_entries": [
        {
          "name": "Funds",
          "column": "entry_type",
          "aggregate_type": "count",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "show_pie_chart": "true",
              "default_comparison_column_entry": "program",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "department",
                    "name": "Department",
                    "aggregate_type": "count",
                    "render_type": "bar",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "departments"
                  },
                  {
                    "column": "program",
                    "name": "Program",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "0",
                    "prefix": "",
                    "suffix": ""
                  },
                  {
                    "column": "category",
                    "name": "Category",
                    "aggregate_type": "count",
                    "render_type": "bullet",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "categories"
                  }
                ],
                "default_secondary_metric": "Program"
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "department",
                    "name": "Department",
                    "aggregate_type": "count",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "departments"
                  },
                  {
                    "column": "category",
                    "name": "Category",
                    "aggregate_type": "count",
                    "precision": "0",
                    "prefix": "",
                    "suffix": "categories"
                  }
                ],
                "default_secondary_metric": "Category"
              }
            }
          },
          "precision": "0",
          "prefix": "",
          "suffix": "funds",
          "tags": [
            "Cases",
            "Clearence rates"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "30000",
              "to": "100000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Total amount spent",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "suffix": "Total",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "show_pie_chart": "true",
              "default_comparison_column_entry": "approved_amount",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "approved_amount",
                    "name": "Approved Amount",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Approved"
                  },
                  {
                    "column": "recommneded_amount",
                    "name": "Recommended Amount",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Recommended"
                  }
                ],
                "default_secondary_metric": "Approved Amount"
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "approved_amount",
                    "name": "Approved Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Approved"
                  },
                  {
                    "column": "recommneded_amount",
                    "name": "Recommended Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Recommended"
                  }
                ],
                "default_secondary_metric": "Approved Amount"
              }
            }
          },
          "quick_filters": [
            {
              "column": "program",
              "type": "text",
              "field": "quick_filter_0_s8xp_hq5q_2",
              "values": [
                "a"
              ],
              "operator": "like"
            }
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "30000",
              "to": "100000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Amount spent on Salary And Wages",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "show_pie_chart": "true",
              "default_view": "piechart"
            }
          },
          "quick_filters": [
            {
              "column": "category",
              "type": "text",
              "field": "quick_filter_0_s8xp_hq5q_4",
              "values": [
                "Salary and Wages"
              ],
              "operator": "="
            }
          ]
        },
        {
          "name": "Total amount approved",
          "column": "approved_amount",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
                "default_view": "scatterplot"
            }
          },
          "prefix": "$",
          "precision": "2"
        }
      ],
      "filter_by_entries": [
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "fiscal_year",
          "name": "Year"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "service",
          "name": "Service"
        },
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "program",
          "name": "Program"
        },
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "category",
          "name": "Category"
        },
        {
          "column": "fiscal_year",
          "name": "Year"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "service",
          "name": "Service",
          "renderType": "text"
        },
        {
          "column": "department",
          "name": "Department",
          "renderType": "text"
        },
        {
          "column": "program",
          "name": "Program",
          "renderType": "text"
        },
        {
          "column": "fund",
          "name": "Fund",
          "renderType": "text"
        },
        {
          "column": "category",
          "name": "Category",
          "renderType": "text"
        },
        {
          "column": "fiscal_year",
          "name": "Year",
          "renderType": "number"
        }
      ],
      "map": {
        "centerLat": "38.760910",
        "centerLng": "-121.302611",
        "zoom": "10",
        "shapes_outline_highlight_width": "4",
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
      "shape_datasets": [
        {
          "shape_dataset_domain": "tylertech.demo.socrata.com",
          "shape_name": "Elgin Police Beats",
          "dataset_id": "r52y-uc86",
          "fields": {
            "shape": "multipolygon",
            "shape_id": "_feature_id"
          },
          "color": "#ffff66"
        }
      ],
      "shape_outline_dataset_entries": [
        {
          "shape_outline_dataset_domain": "rosevillepd.data.socrata.com",
          "outline_name": "Beats",
          "shape_outline_dataset_id": "ujv7-87d7",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#d73b70",
          "show_by_default": "true"
        },
        {
          "shape_outline_dataset_domain": "rosevillepd.data.socrata.com",
          "outline_name": "Parks & Recreation",
          "shape_outline_dataset_id": "pn3p-r56a",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#0b19b3",
          "show_by_default": "false"
        },
        {
          "shape_outline_dataset_domain": "rosevillepd.data.socrata.com",
          "outline_name": "City Boundary",
          "shape_outline_dataset_id": "79cn-t7i2",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#299c0c",
          "show_by_default": "false"
        }
      ]
    },
    {
      "name": "Opex Revenue",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "mik7-qbhe",
      "fields": {},
      "dimension_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "source",
          "name": "Source"
        }
      ],
      "view_entries": [
        {
          "name": "Total Revenue",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "recommneded_amount",
                    "name": "Recommended Amount",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Recommended"
                  },
                  {
                    "column": "actual_amount",
                    "name": "Actual Amount",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Actual"
                  }
                ],
                "default_secondary_metric": "Actual Amount"
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "recommneded_amount",
                    "name": "Recommended Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Recommended"
                  },
                  {
                    "column": "actual_amount",
                    "name": "Actual Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Actual"
                  }
                ],
                "default_secondary_metric": "Actual Amount"
              }
            }
          },
          "tags": [
            "Cases",
            "Judges"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "30000",
              "to": "100000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Total Projections",
          "column": "projected_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "dollar",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
                "default_view": "scatterplot"
            }
          },
          "precision": "2"
        }
      ],
      "map": {
        "centerLat": "42.038333",
        "centerLng": "-88.322778",
        "zoom": "10",
        "shapes_outline_highlight_width": "4",
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
      }
    },
    {
      "name": "Capex Budget",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "dszp-jd2s",
      "fields": {},
      "dimension_entries": [
        {
          "column": "service",
          "name": "Service"
        },
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "project",
          "name": "Project"
        }
      ],
      "view_entries": [
        {
          "column": "approved_amount",
          "name": "Approved Amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "piechart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "actual_amount",
                    "name": "Actual Amount",
                    "aggregate_type": "sum",
                    "render_type": "bullet",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Actual"
                  }
                ]
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "actual_amount",
                    "name": "Actual Amount",
                    "aggregate_type": "sum",
                    "precision": "2",
                    "prefix": "$",
                    "suffix": "Actual"
                  }
                ]
              }
            },
            "tags": [
              "Cases",
              "Clearence rates"
            ]
          }
        },
        {
          "column": "actual_amount",
          "name": "Actual Amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
                "default_view": "piechart"
            }
          },
          "tags": [
            "Cases",
            "Judges"
          ]
        }
      ],
      "map": {
        "centerLat": "38.760910",
        "centerLng": "-121.302611",
        "zoom": "10",
        "shapes_outline_highlight_width": "4",
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
      }
    },
    {
      "name": "Payroll",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "qu7r-i9cv",
      "fields": {},
      "dimension_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "position_title",
          "name": "Job"
        },
        {
          "column": "position_type",
          "name": "Position Type"
        }
      ],
      "view_entries": [
        {
          "name": "Annual Total",
          "column": "pay_total",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "tags": [
            "Cases",
            "Districts and counties"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
                "default_view": "scatterplot"
            }
          }
        }
      ],
      "map": {
        "centerLat": "42.038333",
        "centerLng": "-88.322778",
        "zoom": "10",
        "shapes_outline_highlight_width": "4",
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
      }
    },
    {
      "name": "Cobb-Dekalb-Fulton",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "3hre-b49k",
      "fields": {
        "date_column": "tax_year",
        "incident_type": "class",
        "location": "geocoded_column",
        "73f8-h8ah": ":@computed_region_73f8_h8ah"
      },
      "dimension_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "owner",
          "name": "Owner"
        }
      ],
      "group_by_entries": [
        {
          "column": "county",
          "name": "County"
        },
        {
          "column": "year_built_1",
          "name": "Year"
        }
      ],
      "view_entries": [
        {
          "name": "Mean ratio",
          "column": "(market_total/case(sale_price == 0,1, true, sale_price))",
          "aggregate_type": "avg",
          "precision": "2",
          "tags": [
            "Cases",
            "Districts and counties"
          ],
          "visualization": {
            "default_view": "map",
            "map": {
                "default_view": "point"
            },
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "==",
              "value": "30000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Sales",
          "column": "sale_type",
          "aggregate_type": "count",
          "stacked_column": "sale_type",
          "precision": "",
          "tags": [
            "Cases",
            "Districts and counties"
          ],
          "visualization": {
            "default_view": "map",
            "map": {
                "default_view": "choropleth"    
            },   
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Building value",
          "column": "building_value",
          "aggregate_type": "sum",
          "precision": "2",
          "prefix": "$",
          "visualization": {
            "default_view": "overtime",
            "overtime": {
                "default_view": "timeline"
            },
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "year_built_1",
          "name": "Year"
        },
        {
          "column": "owner",
          "name": "Owner"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "building_value",
          "name": "Building value"
        },
        {
          "column": "county",
          "name": "County"
        },
        {
          "column": "cityname",
          "name": "City"
        },
        {
          "column": "year_built_1",
          "name": "Year"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "sale_date",
          "name": "Sales date",
          "renderType": "date"
        }
      ],
      "map": {
        "centerLat": "32.20410409773211",
        "centerLng": "-82.38302461163329",
        "zoom": "5",
        "mini_map_zoom": "4",
        "shapes_outline_highlight_width": "4",
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
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "73f8-h8ah",
          "shape_name": "State of Georgia",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "name",
            "shape_description": "name"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Incidents Data",
      "dataset_domain": "pinellasparkpd.data.socrata.com",
      "dataset_id": "qs3a-3222",
      "fields": {
        "date_column": "reported_date_time",
        "incident_type": "occurred_incident_type",
        "location": "location",
        "hmbv-vp9r": ":@computed_region_hmbv_vp9r",
        "ntia-f3vs": ":@computed_region_ntia_f3vs",
        "xx7z-z9ah": ":@computed_region_xx7z_z9ah",
        "f3c4-j5m5": ":@computed_region_f3c4_j5m5"
      },
      "dimension_entries": [
        {
          "column": "case_disposition",
          "name": "Disposition"
        },
        {
          "column": "reporting_officer_full_name",
          "name": "Officer"
        },
        {
          "column": "status",
          "name": "Status"
        },
        {
          "column": "assigned_bureau",
          "name": "Assigned Bureau"
        }
      ],
      "group_by_entries": [
        {
          "column": "assigned_bureau",
          "name": "Assigned bureau"
        },
        {
          "column": "agency_name",
          "name": "Agency"
        }
      ],
      "view_entries": [
        {
          "name": "Incidents",
          "column": "occurred_incident_type",
          "aggregate_type": "count",
          "precision": "",
          "prefix": "",
          "suffix": "incidents",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "showCompareDropDown": "true",
              "default_group_by_entry_column": "agency_name",
              "default_comparison_column_entry": "case_disposition",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "status",
                    "name": "Status",
                    "aggregate_type": "",
                    "render_type": "stack",
                    "precision": "",
                    "prefix": "",
                    "suffix": ""
                  },
                  {
                    "column": "case_disposition",
                    "name": "Case Disposition",
                    "aggregate_type": "count",
                    "render_type": "bar",
                    "precision": "",
                    "prefix": "",
                    "suffix": "disposition"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count",
                    "render_type": "bullet",
                    "precision": "",
                    "prefix": "",
                    "suffix": "cases"
                  }
                ],
                "default_secondary_metric": "Status"
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "case_disposition",
                    "name": "Case Disposition",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "disposition"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "cases"
                  }
                ],
                "default_secondary_metric": "Status"
              }
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "true",
              "show_burn_up_chart": "true",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "column": "case_disposition",
                    "name": "Case Disposition",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "disposition"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "cases"
                  }
                ],
                "default_secondary_metric": "Case Disposition"
              },
              "burn_up": {
                "secondary_metric_entries": [
                  {
                    "column": "case_disposition",
                    "name": "Case Disposition",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "disposition"
                  },
                  {
                    "column": "case_id",
                    "name": "Cases",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": "cases"
                  }
                ],
                "default_secondary_metric": "Case Disposition"
              }
            }
          },
          "quick_filters": [
            {
              "type": "date",
              "column": "reported_date_time",
              "field": "quick_filter_5_qs3a_3222_0",
              "dateRange": {
                "start_date": "2019-12-01",
                "end_date": "2019-12-30"
              }
            }
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "1000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        }
      ],
      "filter_by_entries": [
        {
          "column": "status",
          "name": "Status"
        },
        {
          "column": "occurred_incident_type",
          "name": "Incident Type"
        },
        {
          "column": "block",
          "name": "Block"
        },
        {
          "column": "case_arrest_made",
          "name": "Case Arrest Made"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "assigned_bureau",
          "name": "Assigned bureau"
        },
        {
          "column": "agency",
          "name": "Agency"
        },
        {
          "column": "reporting_officer_rank",
          "name": "Officer Rank"
        },
        {
          "column": "reporting_officer_full_name",
          "name": "Officer Name"
        },
        {
          "column": "reported_date_time",
          "name": "Reported Date"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "reported_date_time",
          "name": "Reported Date",
          "renderType": "date"
        }
      ],
      "map": {
        "centerLat": "27.857590",
        "centerLng": "-82.711240",
        "zoom": "12",
        "shapes_outline_highlight_width": "4",
        "show_geocoder_control": "false",
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
          "shape_dataset_id": "hmbv-vp9r",
          "fields": {
            "shape": "multipolygon",
            "shape_id": "_feature_id",
            "shape_name": "zone",
            "shape_description": "zone"
          },
          "color": "#0a4747",
          "shape_name": "Zones"
        },
        {
          "shape_dataset_domain": "pinellasparkpd.data.socrata.com",
          "shape_dataset_id": "xx7z-z9ah",
          "fields": {
            "shape": "polygon",
            "shape_id": "_feature_id",
            "shape_name": "objectid",
            "shape_description": "objectid"
          },
          "color": "#d93909",
          "shape_name": "Us Hwy 19 Buffer"
        }
      ],
      "shape_outline_dataset_entries": [
        {
          "shape_outline_dataset_domain": "pinellasparkpd.data.socrata.com",
          "outline_name": "Districts",
          "shape_outline_dataset_id": "gmha-2akv",
          "fields": {
            "shape": "multipolygon"
          },
          "color": "#d73b70",
          "show_by_default": "true"
        },
        {
          "shape_outline_dataset_domain": "pinellasparkpd.data.socrata.com",
          "outline_name": "Neighborhood12",
          "shape_outline_dataset_id": "2wve-f3n7",
          "fields": {
            "shape": "polygon"
          },
          "color": "#147053",
          "show_by_default": "true"
        },
        {
          "shape_outline_dataset_domain": "pinellasparkpd.data.socrata.com",
          "outline_name": "UsHwy19Buffer",
          "shape_outline_dataset_id": "nhej-vwqe",
          "fields": {
            "shape": "polygon"
          },
          "color": "#750b6e",
          "show_by_default": "false"
        }
      ]
    },
    {
      "name": "Clermont County Property Data",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "rf3x-u64k",
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "5ynq-aczk": ":@computed_region_5ynq_aczk"
      },
      "dimension_entries": [
        {
          "column": "land_use_type",
          "name": "Land Use Type"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "taxdist",
          "name": "Taxdist"
        },
        {
          "column": "cityname",
          "name": "City"
        }
      ],
      "group_by_entries": [
        {
          "column": "cityname",
          "name": "City"
        },
        {
          "column": "land_use_type",
          "name": "Land Use Type"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "taxdist",
          "name": "Taxdist"
        }
      ],
      "view_entries": [
        {
          "name": "Mean Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, estimated_total_market_value) , true, price)",
          "aggregate_type": "avg",
          "precision": "2",
          "visualization": {
            "default_view": "map",
            "map": {
                "default_view": "heat"
            },
            "snapshot": {
              "chart_type": "groupChart"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "true",
              "show_burn_up_chart": "true"
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<=",
              "value": "9",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Median Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, mktval) , true, price)",
          "aggregate_type": "median",
          "precision": "2",
          "visualization": {
            "default_view": "map",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Estimated Total Market Value",
          "column": "estimated_total_market_value",
          "aggregate_type": "sum",
          "precision": "2",
          "prefix": "$",
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "groupChart"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "true",
              "show_burn_up_chart": "true",
              "default_view": "burn_up"
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "tax_year",
          "name": "Tax Year"
        },
        {
          "column": "style",
          "name": "style"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "address",
          "name": "Address"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "estimated_total_market_value",
          "name": "Estimated Total Market Value"
        },
        {
          "column": "tax_year",
          "name": "Tax Year"
        }
      ],
      "map": {
        "centerLat": "39.018425261608655",
        "centerLng": "-84.00102962486125",
        "zoom": "7",
        "mini_map_zoom": "7",
        "shapes_outline_highlight_width": "4",
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
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "5ynq-aczk",
          "shape_name": "Clermont Township Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "townname",
            "shape_description": "label"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Parcels",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "rf3x-u64k",
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "5ynq-aczk": ":@computed_region_5ynq_aczk"
      },
      "parent_queries": [
        "select *,:@computed_region_5ynq_aczk,avg(asr) over (partition by land_use_type='commercial') as median_asr, 1-asr/median_asr as asr_deviation_from_median"
      ],
      "dimension_entries": [
        {
          "column": "style",
          "name": "Syle"
        },
        {
          "column": "grade",
          "name": "Grade"
        }
      ],
      "group_by_entries": [
        {
          "column": "nbhd",
          "name": "Neighbourhood"
        }
      ],
      "view_entries": [
        {
          "name": "Average Absolute Deviation",
          "column": "asr_deviation_from_median",
          "aggregate_type": "avg",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Coefficient of Dispersion",
          "column": "avg(asr_deviation_from_median)/avg(median_asr)",
          "aggregate_type": "",
          "precision": "2",
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "groupChart"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "true",
              "show_burn_up_chart": "true",
              "default_view": "area"
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "30000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Price Relative Differential",
          "column": "avg(asr)/(   sum(estimated_total_market_value)/sum(price)    )",
          "aggregate_type": "",
          "precision": "2",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "tax_year",
          "name": "Tax Year"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "estimated_market_land_value",
          "name": "Estimated Market Land Value"
        },
        {
          "column": "stories",
          "name": "Stories"
        },
        {
          "column": "basmt",
          "name": "Basement"
        },
        {
          "column": "attic",
          "name": "Attic"
        },
        {
          "column": "extwall",
          "name": "Exterior Wall"
        }
      ],
      "map": {
        "centerLat": "39.018425261608655",
        "centerLng": "-84.00102962486125",
        "zoom": "7",
        "mini_map_zoom": "7",
        "shapes_outline_highlight_width": "4",
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
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "5ynq-aczk",
          "shape_name": "Clermont Township Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "townname",
            "shape_description": "label"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "ERP metrics",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "s8xp-hq5q",
      "fields": {},
      "parent_queries": [
        "select * where service = 'Education'"
      ],
      "dimension_entries": [
        {
          "column": "service",
          "name": "Service"
        }
      ],
      "group_by_entries": [],
      "view_entries": [
        {
          "name": "Funds",
          "column": "entry_type",
          "aggregate_type": "count",
          "visualization": {
            "default_view": "table"
          },
          "precision": "",
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "==",
              "value": "833",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "quick_filters": [
            {
              "type": "text",
              "column": "program",
              "field": "quick_filter_8_s8xp_hq5q_1",
              "values": [
                "Athletics"
              ],
              "operator": "="
            }
          ]
        }
      ],
      "filter_by_entries": [
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "program",
          "name": "Program"
        },
        {
          "column": "category",
          "name": "Category"
        },
        {
          "column": "department",
          "name": "Department"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "service",
          "name": "Service"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "fund",
          "name": "Fund",
          "renderType": "text"
        },
        {
          "column": "program",
          "name": "Program",
          "renderType": "text"
        },
        {
          "column": "category",
          "name": "Category",
          "renderType": "text"
        },
        {
          "column": "department",
          "name": "Department",
          "renderType": "text"
        }
      ],
      "map": {},
      "shape_datasets": [],
      "shape_outline_dataset_entries": []
    }
  ],
  "exploration_card_entries": [
    {
      "name": "1 Opex Budget",
      "link": "google.com",
      "image": "data:image/png;base64,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",
      "exploration_content": "For local and neighboring properties"
    },
    {
      "name": "2 Opex Budget",
      "link": "https://www.google.co.in/maps/@11.0273656,77.0219015,15z",
      "image": "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUSEhIVFhUXFRYVGBgWFxcZFhgZGxceFxkYFRgYICggGB4mGxcXITEhJSkrLi4uFx8zODMsNygtLi0BCgoKBQUFDgUFDisZExkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAMIBAwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAAAQUGAwQHAgj/xABAEAABAgQCBwQIBgIBBAMBAAABAhEAAyExEkEEBSIyUXGhYYGxwQYTIzNCYpHwBxRDUuHxY3KiFZKz0XOCkxb/xAAUAQEAAAAAAAAAAAAAAAAAAAAA/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8A7MT6zsbvgJx7Nm/qAnHu0b7ygJxbKaEXPTKAHxez4Z8qQO/s+vW0DvsChFzyvA/wfFx684AdvZ9etoT4fZ8c+dIbtsfFx684Hw7BqTY86CAAcGzd/wCoQPq+1+60MHDsqqTY9M4Bsb1X+84BAer7X7oYGDau+XOsJJwHaL2pcj6/dIwStLQxXiBTiKeRFc+zPtgM7YfaccudYG/U6dLx5EwAesKgUG1aV6RHaXrlCS6NqtqgClzxgJRn9p05UvCIxbdmy5ViBOvlu+BPJy0ZtH1yVLGIJSkX2mtWxNeUBMkY9qzf3CI9Z2N33/qElQmALQdnx+kM7e7RvvKAZPrKWbvgJx7Fmz5UgJx7tG+8oCcWyKEXPSAHxez4Z8oT/pdetobvsChGfKB/g+Lj15wA7ez6862hPh2LvnzpDdtj4uP3WB8Owak2POggAHBs3f8AqED6vtfut/cMHBRVSbfZgGxvVfy5wCA9XW790DYNu75c6wwMG9V/vOEBh2jUGw51gG2H2nHLnCb9Xp0vAA22apOXOBvj+Hh05XgBn9p05UvA2Lbs2XKsNn2/h4QiMW2KAXHKpgAj1m1Zv7gPtOxu+/8AUMjHVNAL/YhHb3aNfv5QD/O9nWCD8yn9vQQQCO17unHLwhnaoihFzbrzgNfd9+XK8amstYIlJBD4iWYZ8b9sBl0vSUoQSXBS2IgVuAa51MaU7XkoBhiUr9wHmSDFf03SzMUVVD3BL9tKBhaka7wFx0HT5c1LJO32731jYCgNkkFWRu3CuUUZ4aFkFwSDxFD0gJ+brUHYWFJSfj/UbiAQWD+ceZZZCVTJktUvG/xrUaW7C2URGk6UVsVFRVmSaN2DIxk/Nj1RlhJ3sTku1GLU5QEqvTFSySpSFrBCS6SApIqyVGgIJP1jNqmXQqw4UE0qF/8Aa78A5PDvGkjRlTgnGDLQiWAlRBLs2WYvGlqrSQiaCVMh2VS4ycfTlASeudWrPtE1QA4BUSRyB7GiDeLjpk1KUEzD7MhhnezAVtFLJgPbxIakkhUwOAQl1EEZDPhdo0pOizF1ShRHFqfW0WTU+gqlpctXeZrcCbnP6wEgEvubKRcCnQQHa93Rr5crQzXc3c/s9kI19335crwDO1uU45eEBrRNFC5tzrziL1jrqWg4ZVVZtQcic415XpClqoKVPdLEEd9qwE3fZFFZnxrGr+ZUVmWhDkMFLJatyBRzSH/1CUUpIWAVPW1g6gSbGIiXrNEpLS1FW0TtJteynzPYe6AsPynf4/zENpGvQklKU4yH2iW+lHiFm6YoqUoKUMRxXqDWxHMxgKnqbwEkjXE194Gr7QB7nu3KJWTryT8WI8HDt1irvA8BbZOtpNSpb9hBf6EeEag1+jEdhSk5OR4RXXgeAs0vXsrFULwniAw7n8I9zNdSQq5Un9oB8CwvWKs8DwFola7lKVmlPAinRxG7K0hCyTLUClLFQB8heKVFn1IgqSJuBCbpJQGdIu/G0BJkYqooBfLwgO17ujXy5W74DX3ds/swGvu+/LlfvgH66X+3oIIMUr7BggMKppdpKCTmTQWpU3rSkR+k6uXOUMeAAZIJKq3dSgAO4RLHZ93XjnAaVRVWefTnAaP/AEiQzJQCpgCCSed7Htip6SgJUQlQUMiIu2kjYUUllFJdrhxUsK0ijaXPxLUoWKi3LLo0B5eB4xvA8BtaLJMxaUBnJatuMWjRdTykpKZjuQwVQGzFm83inomlJdJIIzFDE9peu1mSkqSCpYWkF6MKEtx/9QHn83LxDR1pxS0nCk4i6VHOhZQc/SNzVOqEJJVMKVscI4Agv9WamUVV4svorOSUqlqIG1iFQCaAGnCnWA2/SBCzJLB0hQIo9OzP+HiP1FqoLHrJo2MqsD2lq3ixX2VbmR8KwfL8HH+ecAsLDCmktmpYDxvEXq/V85K8SpxUgOGBUQRm4NuvOJX5Rucf5hLVhtuXUcgMyTlSAZ+Tdz+z2RF661omUMEonEoX4CwNc7x5la29uEIUDKUGFDVWdSKHJuXGMHpPo8sYF1L7BYigqX53gK9ij3Lm4SCGoXqHHeMxGB4HgM8ycTfuAAAHICkeHjG8DwGTFA8Y3geAyPA8Y3geAyPA8Y3geAyPEvqbVSZqca1EJCiks3AG5fiMohHja0fWU1CcCVkJd2oR1gLFrHVxGj4JbqSk4gSzm7t9TSM2ptPM1FgAkgKa3McKZdka2o9aFQRKWbgsriBcKORH/rjWTl6KlC1KliiwAtrUJr2FjAZj/jtn9mA/4u/yv3wGlEVGecB2fd1458vOAeGV9kwQeql/u6wQAdjdq98/CAjDtJqTcdcoCPV2q8BGDau/9wEbr7TRJl4kn2i6Dseqj3eJEUrFG/6Sz8WkKq4DAdlHI+pMReKAy4oMUYsUGKAy4oaS7B/qWA+tow4omtRajXOKVKDSi7l2JoWYc4Bao0STMKvWLISlIJUFAXLABJSSedMqRJan0NSNIUlUtSUMoBVDY0JU2YFgw7IkdE1PJxFSUMaNmBRqDud6lyYkAcezZs+VIBO+waJFjytWB/g+Hj1va8D4vZ8M+UD/AKeXHrADtsfDx63tHmcihlh8KgxIuAaFja0enb2fXnWMWmz/AFUtdHZClVpkf/UBWNdyJcmYkDEyQCkVY1xEqUTd7sLNWIifpClqKlFyfthwEbema1mT0plYA+PEMILkszNWNxXoxMCXKxiKXCWzbdJenCAhcUGKNjSdHSEuCUrSAJktYIUDQYknMEkUuOUahSQASCxdixYtdjnAe8UGKMWKDFAZcUGKMWKDFAZcUGKMWKDFAZcUGKMWKDFAZcUGKMWKN/8A6biB9UtMwhKVFKXxBxtXGR74CU1RI9gpak1lqUtJLhiEAkPwLCJzVWmmZLB9WUgli9e8GlG7OMetWawTNljDY0L3ScwcojPR3WAK50kHEgrKkE/tKmJ6pPeYCdJw0TUG+fhAdjcq98/CAnBs3f8AqA+ztV/L+4B/lkfu6iCD8mOMEAgPV9r91oGwbV37u2GNjeq/3nABg2jUHLrAUf0q0YInlQc40iaexyR9H8YhsUW70p0NRUFghpktaWz2fbBv+1v7imYoDLigxRaNR+jSFSfWzg+IOACQUpyNMzevZHnXeoJUvRjMlhToYOTVTqAqLWOTWgNL0e1RMmrStmlpUCSoUUxfCkZv9PCLslAWAAAkJDAZN2cLRi0GT7NATshCEgjkKxmO3u0b7ygAn1nY3fDfHs2bO9qQE492jfeUBOLZFCM+kAnxez4Z8qWgf9Lr1tDd9gUIz5QP+n8XHrAJ29n151tGvrBCfVLlKUwUkuqwS+Z5XvGy7bGfHrFQ9K9cJIOjIrhXtqycfCOLG/KA0tA0qRIX6wFc1SSrAGwJ4AqJJNsmziR0T0rXiSkSk7SkjeJN2pTtiqYoMUB0pGrkywvGTN9YMJxXwiyaczW8R2nejY9ShPrC6ScJKbA1w3tFS0bWs6WlSUrOFSSkglwHDOn9p7RD0bXE+XRE1QDMxLjuCnAgNvXGqTICSVPiJCaAEgAHFQni0RmKM+kTZs1HrFrKwghFakO5BPNr5t2Rp4oDLigxRixQY4DLigxRixQYoDLigxRixQYoDLiid9E9PSlapSqetwgK4EOwI7XbnFdxR7kpUpQSiqiQEtxJpAXjWOrSiUZOjoBxrBW5NjwYhgKU4CJHQ9BlyHQhNVXVV60zeMujaQlSWSrFUpxdoJB7bgxlBw7BqTY86QAD6vZu/d2Qvd9r91v7hg4KKqTANjeq/lz5wC/JfN0gg/Kq/d4woBgYd+r2z8YGw1XUGwv0MAp7zuz8IBTf3cvvlAY5ujpJStYcJOJF6EggU5E0jmOsZRRNWkpwspVOAJcN2M0dSHFW5l5UiN1vqSVpDKWCAAwUksoDhV3D8RmYDW0/0jky0IXLImBTAS0qAUA3xJq1aM2cbekytJWBMlLRLZIJlFLpKrqClCpGTgC0VPXWoJmjqE+QCqUkpWCWJSUkbwo4cXaLJ6L6ymaRKK1hICVlJw0BAAUS3JTQHrRddpIHrh+XU7YVnCFcSizjtPERLb/u6ccn4WjFpGjy1tsIUPmSk/TFzEZAmgEoAABmFB2MIBna3KccvCDeomihc2fvHbDNfd045eMBrRG9n59YBX2U0ULnlet4Pl+Pj1ve0PsTv5+dYXZ+p958oDV1tpfqpMxTOtKSQb1yL3o/SOXlb1Jjo/pPOwaLNcOspwnsCjhd+wGOZYoDLigxRixQYoDLih4ow4oMUBI6r0lKV4Znu1jAvsBNFc0kBXdGtOlqQooUGUksR2xr4omtYzxpMuUpCSZyAJcwAEqUGASsNcO47CodkBF4ovXorJVNkBc1CFJSWSVJBUpIu7ivB827zE6i9E1qaZpAKZf7Qdo82sOvKLoiWAAJYaWAAwoGGTcoCqekXo6NufJwplpQpS01cEAq2RZjwo0VHFHWpiAoEJGwQyhx49I5lL0Afmho6iW9bgcXIJoexwx74CS1J6NrnoUsnCGOAH4qFi+Qdsq1iEnIUhRSoEKSWIORjqyUBgmUGYAMKUFAIrnpZqeWqXNnof1qQlSq0woDKYcq/wD1EBVNW6EqcpSUXCFLYXLCgA4kkdYvWqdRyZQSyT64CqiXYkVAago4oI54iZMkrSoYkLDKSWyNiOII7jWOo6BpImSpaxvrQlX1AJrygFoqpSSqQjCJgJUQLgrOJ3vnGxbZVVRsbs9q84hNI0cydJ/MEg+sSJagcWJJoxlhIOOiQ4uGJibQoNtbx3e+3KsAxs0XUm2fjCGzv1e2fO8MU375ZwhT3ndnzt3QB6iZ+7qYIME3j1EKAY/y93naAfPu5eVuyAbXvKcMoBWi6Jyy+6QAPm3MvK1bQc/d/ffeAVorcyPhWD5fg4/zzgPM2WFApNZSgUnkQx7Yq/qNK0GWsSSibo6faEqDKyCkUN2q7cewRavlG5x/nnEH6Z6emVoy0Av6wYEjiTc8gPLjAc90rT5kxapilHErgTQPiAHAAgMOwRKaD6W6VLUCZmNOaSE1H+zO/bFexQYoDsWg6dLmoSvR1A4g5DjEMqg2Y0jZPyb2fnftjjGj6StCgtCilQspJYiOrag1qnSJImo95aYm7HOmQJqOyAkf9d/PzvSDl7z77rQ7VTv5jxpB83x8P45QGHStHRMQpEwOpQKSOfS0cs1xq2Zo8wy5g7UnJSeI8xkY6z8x3+H8cow6VokualpyEqILhKgCHFqGA49ihkx1zRtXSEnEJMtChbChKT0EV3021fJEmZPUjDOKkAEEjEaJIIJbdBtwEBRcUGKMOKDFAZsUZdG0tctWJCilTEODkco1MUSOo9Vr0mZ6tJwgB1LIcJHE8XNAIC3+gUuYpM2dMKiFFKMSiS4S5NTW6ukWs/LuZ+d62jDoOjCVLRJR7tIAfjxJPElz3xmNKJ3cz415QAf8e7n9nsiu+kWrwiYNNlDEZaUjABVS8QSknM0Uf+0RYjSiKjPOA7Pu68c+UAkqcAywQSASDcdheMOnyBMlrloIC1oUgv8AMkg058I2Ds+7qc840ddarlz5RlkAqNQblCslDMEHzGcBDaDKkabJly1D2sggLSLnCCgsr9pIBpwiyJSlKaMlSRagAA7LAYYpvois/mZqlqCJ6UKTMQRRe0HmAuwIatKvizManppr2aZi9HAwAEYiCcSwUg14Cts84CyyFS58mZMlLTOmqWpQxOA4ZKUFOQwAJP7gTxjb1EqaZCDpAInVZ2BZzgcCgyit+jOtRJ0eSgSwqZMVNKXWlALKwhyq6iThAzwxZhppxn1yQjDJTNxPQF1YkklnAYEHnAbw/wAl8vsQh/l7vO3dHmRMTMSFlQIIBSQaEGoI4x6G17ynDLn5QA837aCD1szh0ggAbe/RrZeMAOKiqAWNvGGD6y9GgBx7Jo39QCFdk0SLHlatoPk+Hj1va8AOLYsBnypA7+zy49YA+T4ePW9opP4mSSBIUA6QVgqrQnCwJFKsfpF2dvZ5cesa+stEEyUvRzaYkpfgTY9xY90BxfFBijzPlqQpSFBlJUUqHAgsR9RHjFAZcUZ9D0+ZKVilTFINnSSHHA8e+NPFBigL36J+ls5U1MqbtlZISugILEsoCirdh5xe2+P4uHS17Rzj8PdVlcw6UoAolEpSMzMIGXAJU/MjhHR2/Uz4dIAZ9s73D+LwmfaNFCw4tUUvDZ/aZ8OkDYtuxGXKsAAYqqoRYW8Y1dZaEnSZSpc3ZBDA2Y3BD8CBG0Bj2jRv7gA9ZejecBxGfLUhSkKDKSopI7QWPUR4xRu+kc1J0qeUWM1X1fa/5PEbigMuKOn+gejhOiJs0xSlqUBwOEBzwwt9Y5Xijp34daTj0T1VWTMWl/pMp/3QFntsDd4/zaA02RVJuedDW0aGrNby5y5siW5EpeAqyJL1TyIUO6N8nDsXBz50gAnDRNQbm/hAdjcq98/CGTg2RV/6hH2dqv5f3AMjBuVe+fhARh2k1JuL9uUBHq6irwEYNoVfLnWAqfpVqNImJ00FxiSZ6CkrdDBKmSAaYdkg0arisedJTq7T1AiaoTsIDJdBIdgGWllEdlaxbmw+0zOXOMMzRUEiepCStNiUgkZUUQ4gIH/+aI0iRNlqKESZYAFySle619pKlOYmdI0MzMRXNUxCgZeFGEgpZqpxXfPMwDVyazUkpVUgJw7Ki7qDipL/ABOKCkams9ZydElpmTVLdyEpJK1rI2jew+gDi1ICnekWgaToaZSk6QsoS8tFSlSXGIhhQgtfsbKJf0c9Klz0KRNQqbOQMSRLCQVpcAlWJkhi1moaCkSem6w0bSdDXpMxBVKQFHCQyiRTZJsXOFwczWPWjagl+slTtHwycCcC0hLiag2xVDKDPiq9HgJPQps5MtAmbSwkYi2bVqGfmweCM/5w8IUA39Z2N33gfHs2bO/ZDJ9Zu0b7ygJx7IoRn0gE+L2dmz5UtA7+y69bQ3xbAoRnypA/6efHrAJ29n162gfD7O7586Whu3s8+PWB8Owak586QFP9M/RSWoLnyzhmhJWr9qwkZjJTC47xnHNMUd5WhgZaq4gR9Q0cCqKG4oYDJigxRjxROeiWoxpcxQUspQgAqwjaLlmS9Ba5flAXT8M5ZRoy5psqaQB2BKQ78wR3Rbm/V6dLxr6u0CXo8tKZaWlgUS5JqXck3LkxsN+plw6QAz+06cqXgbF7SzZcq3hs/tMuHSERi2xQDLlWAGx7Vm7+2H7zsbvv/UBGPaFAP7hH2m7RvPlAcQ1roqpM6ZKWXUlTP+56hVeIIPfGpii2fidIA0lE0BhMlsf9kFj/AMSj6RT3gJXUGql6VOTJQQlwSSckhnLZmtovPpMhOg6CZGjqKCqYl1YiFqNCohrFki1GiL/DbUZWr80VMBjQlNalgCongxIaLV6U6gGmIlyseBSFviw4gQRUM47D3QEf+HGi4dFJKWVOWS+eFOykHiHCiP8AaLU+H2d3z50tGHQtHTKlo0dPwJCAeQuYzvh2DUnPnSAT+r2bv3dkHu+1+639wwcGyak/1APZ71X8ucAm9XW790DYNu75WvW8MDBU1eADDtGoOXOsAmw+045c+2Bv1enS8MBts2OXOOY/iRrdatIMhKyJaUJxJBoVGu0BejUMBN+l/pehCcOjTAqapwVJIIlgUooUKjlwvwfnS56lMFKUQLOSWepZ7VjA8GKAnpvpGtWhjRFJDApAUKbAOLCoZnE1c6vWp6V6KLVO0OQVKJIQxJqTUivJo4vijov4WTMcufLBYpWlfYy0tT/8z9RAXr878vX+IUevzaf2+EKADtblGvl4QHaomhFzZ+8QGvu6ccoDWiKKzy+6wBfZFFC55XreD5fj49b3tBeid/PzrB2Df4/zygD5fj4/ze0K2yaqNjztW8PsO/x/nlCtRW/l5V5wDBw0VUmxv1McI13KwaTPR+2dMH/Mt0ju4pRdVZZ/dY4v6d6OpGnTgoNiKVjtCkguO9x3QEHijpn4YaqMuWvSpgpNZCB8oLlTcCbf6vnFJ9FNWTp08GSUpwEFSlYSEpLg7JBxuHDMe1o7akNvbnwjIcKZUgBm2jVJsOdqWgb4/g4dLWvAKVVuZeVIO34OH8c4Ab4hucP4tAa7SaJFxa16Wg7RucP45wGtU7mfnTlABGKqKAXFvCA7W5stfLwhmtUUTnl90hGvu6ccuUBU/wATpSV6HjCWMuYguw+LY+lR3tFC1T6L6XpCglMlSAbrmJKUgca1PIPHaVAK3O/yhmtEb2fn1gNXVugy5MpGjyg2AM9nPxEkZkue+Nn5Pj49b3tD7E7+fnWF2fHx/nlAP5Tv8f5vCtsqqo2N2e1bw+w7/HwrCtRW/l5V5wDBw0XUmxv4whs79Xtn4wxSi6nLOEKe8rwz5+UAAYd+r2z8YGw7SqpNhftFD2QCnvKjLOAUqvdy8ukAM20apNh4UtHGfTlaTp88otiT9fVpxf8AJ47OKVO5l5UiBHofoOJUw6OClSiolSlmp7CeJgONoSS7AlrsCW58I84o+gZMlKABLSEyhZKQAAOxIjkv4g6nRInhctRInGYtiLHE5YsA22wAsEh7wFYeOjfhToMzDPmhwlRQhJqHw4ipuNSB9Yqvod6OK0yaxcSkMZih0Sk8T0FeD9i0XRkoQmXo4wpQAlhwyvfOsBm9ej9vQQQY5fDpBAB/xd/leA/JvZ/Z7YDT3deOcBpVFVZ5/dYA/wBd/PzvS8HL3n33WgtVO/mPGkHaN/h/HKAOfvPtuy0L/bfy8rUvD7Tv8P45QXqrfyHhTnAA+fey+x2xQPxU0EYJc9QAmYgh6OpIBLUNakG2Rrxv4rVdFZZfdYi/STVn5rRpkpaiks6afEKhxchwLVgKt+E8z2c9K1gpCkYU4nKSysRwgukF01sSDwMXwfPu5eVq2ik/hrqWZIM/8zJXLUfVhJUzEbThLdrP3RdhWi6Jyy5dIA/23MvK1YP/AB/ffeC9FbmR8Kwdnwcf55wBy939v23gPy7mfnetoOwbnH+ecBpRO5mfGvKAP/j3c/s9kB/xd/leGaURUZ5/dIRp7uvHPlAM/wCLv+zAfk3s/O9LwGnu68c4DSqKqzz59YA/138/O9IX/k++60O1U7+Y8aQdvx8P45QBz959t2Whf7b+Xlal4fad/h4UhXqrfyHhTnAMf5N7L7HbCH+Xu87d0MVquhyyhCvvKcMuflAA/wAlsvsQf77uXlatoBX3lBllAK0XROWXLpAH+25l5dsH/j+++8A4K3Mj4Vg7Pg4/zzgDl7v7ftjX0/QJU5OFctK5YLkKALFmJD1BY3EbHYNzj41gNKJ3Mz415QGLRdFRKTg0dCUIuQgAB8y3Fs4yn/F3+V++A0oiozzgNPd1458vOAfsvt4IPVy+PWCAR2Nyr3z8IZ2apqTcX6CAj1dqvARg2hUnLrAJm2hVRuOd6Xgb4/j4dLXtDbDtipOXOsDN7TPh0gD5/i4dLXtCvtGihYcrUvDZ/aZ8OkDYts0Iy5VgADFVVCLC3jCG3v0a2XjDAx7Ro39wAesvRvOAQOPfo1svGAHFRVALG3ZcwA+svRoYOPZNAM+kAnfZNEix5WraB/g+Dj1va8MHFsGgGfKE/wCnlx6wA/wDd4/zaA02U1Sbnnetobt7PLj1hE4dgVBz50gAnDRNQbm/hAdjcq98/CGTg2RV/wCoR9nar+UAyMG5V75+EBGHaTUm4u2dh2wEertV4CMG0Kk5c6wBbaFVG453peF8/wAfDpa9obYdsXOXOBv1M+HSAGfbO9w/i8K+0qihYcWqKXhs/tM+HSBsW2aEZcqwABiqqhFhbxhDb36NbLxhgY9o0b+4B7S9G8/6gEDj36NbLxgfFsqokWNuwVPZDB9ZQ0aAHHsmgGfKkAnfZNEix5WraD5Pg49b2vDBfYyGfKE/6eXHrADtsDd4/wA2gNNlNUm550NRS0N29nlx5wicOwKg586QAThomoN8/CA7G5tPfPlaGTgoKv8A1CPs7Vfy/uAf5dH7uogh/lB+6FALQM+6DRN9Xf4woIByPeHv8YE+9+vhCggGr3v08IJ/vB3eMKCAel7w7vGDT8u+FBAetPsO+DS9xPd4QQQBP92O7wgV7r6eMEEAI919fGCR7tXf4QQQD0PdP3lC0DPugggFoFz3QaJvq7/GFBAOT7w98A9798IUEA1+9Hd4QaR7xP8A9fGFBAPTN4fecGsMu/ygggHp9hBpW4nu8IIIAne7HdAfdfTxgggCX7o9/jBo/u1d/hBBAPQ90/eULQM+7zhQQGqYIIID/9k=",
      "exploration_content": "Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content Exploration card content"
    }
  ]
}
