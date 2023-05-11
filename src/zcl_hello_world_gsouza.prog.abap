*&---------------------------------------------------------------------*
*& Report ZCL_HELLO_WORLD_GSOUZA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCL_HELLO_WORLD_GSOUZA.

CLASS lcl_hello DEFINITION.
  PUBLIC SECTION.
    DATA: lv_string TYPE string.
    METHODS: print.



ENDCLASS.
CLASS lcl_hello IMPLEMENTATION.
  METHOD print.
    lv_string = 'Hello World!'.

    WRITE: / lv_string.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA lo_hello TYPE REF TO lcl_hello.

  CREATE OBJECT lo_hello.

  lo_hello->print( ).
