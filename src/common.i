%insert("lisphead") %{
(in-package :cl-sndfile)
%}

%feature("intern_function", "1");

%typemap(cin) SF_INFO* "sf-info";

