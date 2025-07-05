CLASS zcl_itab_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.
    DATA: recordEntry TYPE initial_type.
    DATA: tableEntry TYPE itab_data_type.
    METHODS fill_itab
           RETURNING
             VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
             VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_itab_basics IMPLEMENTATION.
  METHOD fill_itab.
    CLEAR tableEntry.
    " First Entry
    recordEntry-group = 'A'.
    recordEntry-number = 10.
    recordEntry-description = 'Group A-2'.
    APPEND recordEntry TO tableEntry.

    " Second Entry
    recordEntry-group = 'B'.
    recordEntry-number = 5.
    recordEntry-description = 'Group B'.
    APPEND recordEntry TO tableEntry.

    " Third Entry
    recordEntry-group = 'A'.
    recordEntry-number = 6.
    recordEntry-description = 'Group A-1'.
    APPEND recordEntry TO tableEntry.

    " Fourth Entry
    recordEntry-group = 'C'.
    recordEntry-number = 22.
    recordEntry-description = 'Group C-1'.
    APPEND recordEntry TO tableEntry.

    " Fith Entry
    recordEntry-group = 'A'.
    recordEntry-number = 13.
    recordEntry-description = 'Group A-3'.
    APPEND recordEntry TO tableEntry.

    " Sixth Entry
    recordEntry-group = 'C'.
    recordEntry-number = 500.
    recordEntry-description = 'Group C-2'.
    APPEND recordEntry TO tableEntry.
    initial_data = tableEntry.

  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = initial_data.
    " First Entry
    recordEntry-group = 'A'.
    recordEntry-number = 19.
    recordEntry-description = 'Group A-4'.
    APPEND recordEntry TO updated_data.
  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.
    SORT updated_data BY group ASCENDING number DESCENDING.
  ENDMETHOD.

  METHOD search_itab.
    DATA(temp_data) = initial_data.
    LOOP AT temp_data INTO DATA(record) where number = 6.
      result_index = sy-tabix.
      EXIT.
    ENDLOOP.
  

  ENDMETHOD.

ENDCLASS.
