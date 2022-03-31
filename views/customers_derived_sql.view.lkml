view: customers_derived_sql {
  derived_table: {
    sql: SELECT id,address,city FROM customers ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.string ;;

  }

  measure: count {
    type: count
  }
}
