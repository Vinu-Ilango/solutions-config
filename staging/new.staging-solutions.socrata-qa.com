{
  "application_use": "live",
   "is_private": "true",
  "solutions_app_users": ["sathish@elumitas.com"],
  "branding": {
    "browser_title": "Assessment Connect",
    "title": "Assessment Connect",
    "delimiter": ","
  },
    "exploration_card_entries": [
    {
      "name": "Comp Finder",
      "link": "appraisalandtax.demo.socrata.com",
      "image": "https://www.tylertech.com/Portals/0/Images/Products/CLT-APPRAISAL-Techniques-Prepare-Financial-Support-Download.jpg?ver=2018-09-25-174822-170?format=jpg&quality=80",
      "exploration_content": "Find comps for local and neighboring properties"
    }
  ],
  "date": {
    "startDate": "2017-2-18",
    "endDate": "2020-02-18"
  },
  "tag_list": [
    "Sales",
    "Appeals",
    "New Construction",
    "CompFinder"
  ],
  "template_entries": [
    {
      "name": "Cobb County Property Data",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "n3pu-983n",
      "parent_queries": [
        "select *,:@computed_region_52nt_trix where sale_validity in ('0','00')",
        "select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median"
      ],
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "sua5-m9tm": "sua5_m9tm_objectid",
        "52nt-trix": ":@computed_region_52nt_trix"
      },
      "dimension_entries": [
        {
          "column": "class_cleaned_",
          "name": "Class"
        },{
          "column": "land_use_type",
          "name": "Land Use Type"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "taxdist",
          "name": "Tax district"
        },
        {
          "column": "cityname",
          "name": "City"
        },
        {
          "column": "grade",
          "name": "Grade"
        },
        {
          "column": "stories",
          "name": "Stories"
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
          "name": "Tax district"
        },
        {
          "column": "grade",
          "name": "Grade"
        },
        {
          "column": "stories",
          "name": "Stories"
        }
      ],
      "view_entries": [
        {
          "name": "Estimated Total Market Value",
          "column": "appr_total",
          "aggregate_type": "sum",
          "stack_column": "land_use_type",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          }
        },{
          "name": "Average Sales Ratio",
          "column": "appr_total/case(price <= 0 or price is null, case(appr_total == 0, 1, true, appr_total) , true, price)",
          "aggregate_type": "avg",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "use_dimension_value": "true",
          "tags": [
            "Sales"
          ],
          "parent_queries": [
        "select *,:@computed_region_52nt_trix where sale_validity in ('0','00')"
      ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot",
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "show_scatterplot_range_bar": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "parid",
                    "name": "Number of Sales",
                    "aggregate_type": "count",
                    "prefix": "",
                    "suffix": "",
                    "precision": "0",
                    "render_type": "bullet",
                    "independent_axes_values": "true"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "name": "Benchmark",
                    "value": "1"
                  },
                  {
                    "name": "20% Variance",
                    "value": "1.2",
                    "value1": "0.8"
                  }
                ]
              },
              "scatterplot": {
                "default_show_range": "true",
                "secondary_metric_entries": [
                  {
                    "column": "parid",
                    "name": "Number of sales",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": ""
                  }
                ],
                "default_bench_mark": "20% Variance",
                "default_secondary_metric": "Number of sales",
                "bench_mark_entries": [
                  {
                    "name": "Benchmark",
                    "value": "1"
                  },
                  {
                    "name": "10% Variance",
                    "value": "1.1",
                    "value1": "0.9"
                  }
                ]
              }
            }
          },
          "target_entries": [
            {
              "name": "Meets Standard",
              "color": "#259652",
              "operator": "between",
              "value": "0.9",
              "to": "1.1",
              "icon": "icons-check-circle",
              "target_entry_description": "This metric meets the IAAO standard. The standard is between 0.9 and 1.1."
            },
            {
              "name": "Does Not Meet Standard",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "This metric does not meet the IAAO standard. The standard is between 0.9 and 1.1."
            }
          ]
        },
        {
          "name": "Total Sales",
          "column": "saledt",
          "aggregate_type": "count",
          "stack_column": "land_use_type",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "start_date_override_and_ignore":"true",
          "end_date_override_and_ignore":"true",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_burn_up_chart": "true"
            }
          }
        },
        {
          "name": "Coefficient of Dispersion",
          "column": "avg(asr_deviation_from_median)/avg(median_asr)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Price Relative Differential",
          "column": "avg(asr)/(   sum(sale_appr_value)/sum(price)    )",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "bench_mark_entries": [
                  {
                    "name": "Benchmark",
                    "value": "1"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Average Absolute Deviation",
          "column": "asr_deviation_from_median",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Tax & Appraisals"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "show_scatterplot_range_bar": "true"
            }
          }
        },
        {
          "name": "Median Ratio",
          "column": "sale_appr_value/case(price <= 0 or price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, price)",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "show_scatterplot_range_bar": "true"
            }
          }
        },{
          "name": "% Parcels Sold",
          "column": "(sum(has_sold)/count(*))::double*100",
          "aggregate_type": "",
          "stack_column": "land_use_type",
          "precision": "0",
          "prefix": "",
          "suffix": "%",
          "end_date_override_and_ignore":"true",
          "start_date_override_and_ignore":"true",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "map",
            "map": {
                "default_view": "choropleth"
            },
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            },
            "overtime": {
              "show_burn_up_chart": "true"
            }
          },
          "parent_queries": [
            "select *, :@computed_region_52nt_trix, case(saledt between {START_DATE} and {END_DATE} ,1,true,0) as has_sold"
          ]
        },
        {
          "name": "% Appealed Value Upheld",
          "column": "(sum(decision_value) / sum(appr_total))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          },
          "parent_queries": [
            "select * where appealed='true'"
          ]
        },
        {
          "name": "% Appealed",
          "column": "(sum(was_appealed) / count(*))::double*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          },
          "parent_queries": [
            "select *, :@computed_region_52nt_trix, case(appealed='true',1,true,0) as was_appealed"
          ]
        }
      ],
      "filter_by_entries": [
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
          "column": "sale_appr_value",
          "name": "Estimated Total Market Value"
        },
        {
          "column": "tax_year",
          "name": "Tax Year"
        },
        {
          "name": "Ratio",
          "column": "sale_appr_value/case(price <= 0 or price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, price)"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "style",
          "name": "Style",
          "renderType": "text"
        },
        {
          "column": "appr_total/case(price <= 0 or price is null, case(appr_total == 0, 1, true, appr_total) , true, price)",
          "name": "Sale Ratio",
          "renderType": "number"
        }
      ],
      "map": {
        "centerLat": "33.9608276,",
        "centerLng": "-84.5699291",
        "zoom": "9",
        "mini_map_zoom": "8.5",
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
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "sua5-m9tm",
          "shape_name": "Cobb County City Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "objectid",
            "shape_name": "name",
            "shape_description": "citycode"
          },
          "color": "#32a889",
          "border_color": "#cccccc",
          "mini_map_border_color": "#4d4e4f",
          "outline_highlight_color": "#808080"
        },
        {
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "52nt-trix",
          "shape_name": "County Commission Districts",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "commission"
          },
          "color": "#32a889",
          "border_color": "#cccccc",
          "mini_map_border_color": "#4d4e4f",
          "outline_highlight_color": "#808080"
        }
      ]
    },
    {
      "name": "Appeals",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "22ci-twx5",
      "parent_queries": [

      ],
      "fields": {
        "date_column": "decision_date",
        "incident_type": "own1"
      },
      "dimension_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_type",
          "name": "Land Use Type"
        },{
          "column": "com_name",
          "name": "Commercial Description"
        },
        {
          "column": "heartyp",
          "name": "Hearing Type"
        },
        {
          "column": "attorney",
          "name": "Attorney"
        },
        {
          "column": "case_status",
          "name": "Case Status"
        },
        {
          "column": "reason_for_appeal",
          "name": "Reason For Appeal"
        }
      ],
      "group_by_entries": [

      ],
      "view_entries": [
        {
          "name": "Total Value Under Dispute",
          "column": "sum(county_value)-sum(taxpayer_opinion_value)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Average Value Under Dispute",
          "column": "avg(county_value-taxpayer_opinion_value)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Total Appeals",
          "column": "count(parid)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "heartyp",
          "name": "Hearing Type"
        },
        {
          "column": "attorney",
          "name": "Attorney"
        },
        {
          "column": "case_status",
          "name": "Case Status"
        },
        {
          "column": "reason_for_appeal",
          "name": "Reason For Appeal"
        }
      ],
      "quick_filter_entries": [

      ],
      "bench_mark_entries": [

      ],
      "shape_dataset_entries": [

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
      }
    },
    {
      "name": "New Construction",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "3sa7-53ay",
      "parent_queries": [

      ],
      "fields": {
        "date_column": "tax_year",
        "incident_type": "own1"
      },
      "dimension_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        },
        {
          "column": "nbhd",
          "name": "Neighborhood"
        }
      ],
      "group_by_entries": [

      ],
      "view_entries": [
        {
          "name": "Total Parcels with New Construction",
          "column": "count(new_constr_amount)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "New Construction"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Total Value of New Construction",
          "column": "sum(new_constr_amount)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "New Construction"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        },
        {
          "column": "nbhd",
          "name": "Neighborhood"
        },
        {
          "column": "new_constr_amount",
          "name": "New Construction Value"
        }
      ],
      "quick_filter_entries": [

      ],
      "bench_mark_entries": [

      ],
      "shape_dataset_entries": [

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
      }
    },
    {
      "name": "Comp Finder",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "3hre-b49k",
      "parent_queries": [

      ],
      "fields": {
        "date_column": "tax_year",
        "incident_type": "parcel_id",
        "location": "geocoded_column"
      },
      "dimension_entries": [
        {
          "column": "county",
          "name": "County"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        },
        {
          "column": "building_use",
          "name": "Building Use"
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
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        },
        {
          "column": "building_use",
          "name": "Building Use"
        },
        {
          "column": "owner",
          "name": "Owner"
        }
      ],
      "view_entries": [
        {
          "name": "Total Nearby Properties",
          "column": "parcel_id",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": " parcels",
          "tags": [
            "CompFinder"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Average Price Per SF",
          "column": "price_per_sf",
          "aggregate_type": "avg",
          "precision": "0",
          "prefix": "",
          "suffix": " psf",
          "tags": [
            "CompFinder"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "parcel_id",
                    "name": "Number of Parcels",
                    "aggregate_type": "count",
                    "prefix": "",
                    "suffix": "",
                    "precision": "0",
                    "render_type": "bullet"
                  }
                ]
            }, "scatterplot": {
                "default_show_range": "true",
                "secondary_metric_entries": [
                  {
                    "column": "parcel_id",
                    "name": "Number of Parcels",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": ""
                  }]
          }
        }}}]
      ,
      "leaf_page_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        },
        {
          "column": "price_per_sf",
          "name": "Price Per Square Foot"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "owner",
          "name": "Owner",
          "renderType": "text"
        },
        {
          "column": "building_use",
          "name": "Building Use",
          "renderType": "text"
        },
        {
          "column": "price_per_sf",
          "name": "Price Per SF",
          "renderType": "number"
        }
      ],
      "bench_mark_entries": [

      ],
      "shape_dataset_entries": [
{"shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "qpyi-pamy",
          "shape_name": "County Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "objectid",
            "shape_name": "name10"
          },
          "color": "#32a889",
          "border_color": "#cccccc",
          "mini_map_border_color": "#4d4e4f",
          "outline_highlight_color": "#808080"
        }
      ],
      "map": {
        "centerLat": "33.9608276,",
        "centerLng": "-84.5699291",
        "zoom": "9",
        "mini_map_zoom": "8.5",
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
      "shape_outline_dataset_entries": [
        {
          "shape_outline_dataset_domain": "appraisalandtax.demo.socrata.com",
          "outline_name": "County Boundaries",
          "shape_outline_dataset_id": "qpyi-pamy",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#EB7300",
          "show_by_default": "true"
        }]
    }
]}
