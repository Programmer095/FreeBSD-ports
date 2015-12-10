--- cmake/FindIconv.cmake
+++ cmake/FindIconv.cmake
@@ -48,9 +48,8 @@ find_library(ICONV_LIBRARY
 
 IF(ICONV_INCLUDE_PATH)
   IF(ICONV_LIBRARY)
-    STRING(REGEX REPLACE "/[^/]*$" "" ICONV_LIB_PATH "${ICONV_LIBRARY}")
-    CHECK_LIBRARY_EXISTS(iconv libiconv_open ${ICONV_LIB_PATH} LIBICONV_OPEN_FOUND)
-    CHECK_LIBRARY_EXISTS(iconv iconv_open ${ICONV_LIB_PATH} ICONV_OPEN_FOUND)
+    CHECK_LIBRARY_EXISTS("${ICONV_LIBRARY}" libiconv_open "" LIBICONV_OPEN_FOUND)
+    CHECK_LIBRARY_EXISTS("${ICONV_LIBRARY}" iconv_open "" ICONV_OPEN_FOUND)
     IF(LIBICONV_OPEN_FOUND OR ICONV_OPEN_FOUND)
        SET(ICONV_FOUND TRUE)
     ENDIF()