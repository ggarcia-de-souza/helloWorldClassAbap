CLASS ZCL_MUSTACHE_TEST_GUILHERME DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

      INTERFACES IF_OO_ADT_CLASSRUN.

    TYPES:
      BEGIN OF TY_SONG_DETAIL,
        SONG_NAME  TYPE STRING,
        ARTIST TYPE STRING,
      END OF TY_SONG_DETAIL,

      TY_SONG_DETAIL_TT TYPE STANDARD TABLE OF TY_SONG_DETAIL WITH DEFAULT KEY,

      BEGIN OF TY_PLAYLIST,
        PLAYLIST TYPE STRING,
        SONGS     TYPE TY_SONG_DETAIL_TT,
      END OF TY_PLAYLIST.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MUSTACHE_TEST_GUILHERME IMPLEMENTATION.


METHOD IF_OO_ADT_CLASSRUN~MAIN.

  DATA LV_TEXT TYPE STRING.
  DATA LT_MY_DATA TYPE STANDARD TABLE OF TY_PLAYLIST WITH DEFAULT KEY.
  DATA LR_DATA TYPE REF TO TY_PLAYLIST.
  DATA LO_MUSTACHE TYPE REF TO ZCL_MUSTACHE.

  APPEND INITIAL LINE TO LT_MY_DATA REFERENCE INTO LR_DATA.
  LR_DATA->PLAYLIST = 'PLAYLIST 1'.
  LR_DATA->SONGS = VALUE TY_SONG_DETAIL_TT( ( SONG_NAME = 'ENJOY THE SILENCE' ARTIST = 'DEPECHE MODE' )
                                          (   SONG_NAME = 'EVERYBODY WANTS TO RULE THE WORLD' ARTIST = 'TEARS FOR FEARS' )
                                          (   SONG_NAME = 'TAKE ON ME' ARTIST = 'A-HA' ) ).


  LO_MUSTACHE = ZCL_MUSTACHE=>CREATE(
    'Songs in {{PLAYLIST}}!' && CL_ABAP_CHAR_UTILITIES=>NEWLINE &&
    ' {{#SONGS}}' && CL_ABAP_CHAR_UTILITIES=>NEWLINE &&
    ' {{SONG_NAME}} == {{ARTIST}}' && CL_ABAP_CHAR_UTILITIES=>NEWLINE &&
    ' {{/SONGS}}' && CL_ABAP_CHAR_UTILITIES=>NEWLINE ).

  APPEND INITIAL LINE TO LT_MY_DATA REFERENCE INTO LR_DATA.
  LR_DATA->PLAYLIST = 'PLAYLIST 2'.
  LR_DATA->SONGS = VALUE TY_SONG_DETAIL_TT( ( SONG_NAME = 'WEIRD FISHES' ARTIST = 'RADIOHEAD' )
                                          (   SONG_NAME = 'IM STILL STANDING' ARTIST = 'ELTON JOHN' )
                                          (   SONG_NAME = 'SULTANS OF SWING' ARTIST = 'DIRE STRAITS' ) ).


  LO_MUSTACHE = ZCL_MUSTACHE=>CREATE(
    'Songs in {{PLAYLIST}}!' && CL_ABAP_CHAR_UTILITIES=>NEWLINE &&
    ' {{#SONGS}}' && CL_ABAP_CHAR_UTILITIES=>NEWLINE &&
    ' {{SONG_NAME}} == {{ARTIST}}' && CL_ABAP_CHAR_UTILITIES=>NEWLINE &&
    ' {{/SONGS}}' && CL_ABAP_CHAR_UTILITIES=>NEWLINE ).



  OUT->WRITE(  LO_MUSTACHE->RENDER( LT_MY_DATA ) ). " ls_my_data type ty_shop

ENDMETHOD.
ENDCLASS.
