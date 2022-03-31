connection: "looker-demo-sourabhjain"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }


datagroup: products_dg {
  max_cache_age: "4 hours"
  interval_trigger: "2 hours"
  label: "products datagroup label"
  description: "products datagroup description"
}

explore: products {
  conditionally_filter: {
    filters: [id: "123"]
    unless: [brand]
  }
  persist_with: products_dg
}

explore: products_pdt {
  persist_with: products_dg
}

explore: customers {
}

explore: customers_derived_native {}

explore: customers_derived_sql {}
