%insert("lisphead") %{
(in-package :cl-sndfile)
%}

%feature("intern_function", "1");

%typemap(cin) sf_count_t ":long-long";
%typemap(cin) SF_INFO* "sf-info";

