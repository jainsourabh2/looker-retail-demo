# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: transaction_detail {
  hidden: yes

  join: transaction_detail__line_items {
    view_label: "Transaction Detail: Line Items"
    sql: LEFT JOIN UNNEST(${transaction_detail.line_items}) as transaction_detail__line_items ;;
    relationship: one_to_many
  }
}

view: transaction_detail {
  sql_table_name: `sourabhjainceanalytics.retail_demo.transaction_detail`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: channel_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.channel_id ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: line_items {
    hidden: yes
    sql: ${TABLE}.line_items ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      stores.id,
      stores.name,
      customers.last_name,
      customers.id,
      customers.first_name,
      channels.id,
      channels.name
    ]
  }
}

view: transaction_detail__line_items {
  dimension: cost {
    type: number
    sql: cost ;;
  }

  dimension: product_id {
    type: number
    sql: product_id ;;
  }

  dimension: sale_price {
    type: number
    sql: sale_price ;;
  }

  dimension: transaction_detail__line_items {
    type: string
    hidden: yes
    sql: transaction_detail__line_items ;;
  }
}
