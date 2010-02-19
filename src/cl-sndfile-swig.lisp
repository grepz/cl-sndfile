
(in-package :cl-sndfile)



;;;SWIG wrapper code starts here

(cl:defmacro defanonenum (&body enums)
   "Converts anonymous enums to defconstants."
  `(cl:progn ,@(cl:loop for value in enums
                        for index = 0 then (cl:1+ index)
                        when (cl:listp value) do (cl:setf index (cl:second value)
                                                          value (cl:first value))
                        collect `(cl:defconstant ,value ,index))))

(cl:eval-when (:compile-toplevel :load-toplevel)
  (cl:unless (cl:fboundp 'swig-lispify)
    (cl:defun swig-lispify (name flag cl:&optional (package cl:*package*))
      (cl:labels ((helper (lst last rest cl:&aux (c (cl:car lst)))
                    (cl:cond
                      ((cl:null lst)
                       rest)
                      ((cl:upper-case-p c)
                       (helper (cl:cdr lst) 'upper
                               (cl:case last
                                 ((lower digit) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:lower-case-p c)
                       (helper (cl:cdr lst) 'lower (cl:cons (cl:char-upcase c) rest)))
                      ((cl:digit-char-p c)
                       (helper (cl:cdr lst) 'digit 
                               (cl:case last
                                 ((upper lower) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:char-equal c #\_)
                       (helper (cl:cdr lst) '_ (cl:cons #\- rest)))
                      (cl:t
                       (cl:error "Invalid character: ~A" c)))))
        (cl:let ((fix (cl:case flag
                        ((constant enumvalue) "+")
                        (variable "*")
                        (cl:t ""))))
          (cl:intern
           (cl:concatenate
            'cl:string
            fix
            (cl:nreverse (helper (cl:concatenate 'cl:list name) cl:nil cl:nil))
            fix)
           package))))))

;;;SWIG wrapper code ends here


(defanonenum 
	(#.(swig-lispify "SF_FORMAT_WAV" 'enumvalue) #x010000)
	(#.(swig-lispify "SF_FORMAT_AIFF" 'enumvalue) #x020000)
	(#.(swig-lispify "SF_FORMAT_AU" 'enumvalue) #x030000)
	(#.(swig-lispify "SF_FORMAT_RAW" 'enumvalue) #x040000)
	(#.(swig-lispify "SF_FORMAT_PAF" 'enumvalue) #x050000)
	(#.(swig-lispify "SF_FORMAT_SVX" 'enumvalue) #x060000)
	(#.(swig-lispify "SF_FORMAT_NIST" 'enumvalue) #x070000)
	(#.(swig-lispify "SF_FORMAT_VOC" 'enumvalue) #x080000)
	(#.(swig-lispify "SF_FORMAT_IRCAM" 'enumvalue) #x0A0000)
	(#.(swig-lispify "SF_FORMAT_W64" 'enumvalue) #x0B0000)
	(#.(swig-lispify "SF_FORMAT_MAT4" 'enumvalue) #x0C0000)
	(#.(swig-lispify "SF_FORMAT_MAT5" 'enumvalue) #x0D0000)
	(#.(swig-lispify "SF_FORMAT_PVF" 'enumvalue) #x0E0000)
	(#.(swig-lispify "SF_FORMAT_XI" 'enumvalue) #x0F0000)
	(#.(swig-lispify "SF_FORMAT_HTK" 'enumvalue) #x100000)
	(#.(swig-lispify "SF_FORMAT_SDS" 'enumvalue) #x110000)
	(#.(swig-lispify "SF_FORMAT_AVR" 'enumvalue) #x120000)
	(#.(swig-lispify "SF_FORMAT_WAVEX" 'enumvalue) #x130000)
	(#.(swig-lispify "SF_FORMAT_SD2" 'enumvalue) #x160000)
	(#.(swig-lispify "SF_FORMAT_FLAC" 'enumvalue) #x170000)
	(#.(swig-lispify "SF_FORMAT_CAF" 'enumvalue) #x180000)
	(#.(swig-lispify "SF_FORMAT_WVE" 'enumvalue) #x190000)
	(#.(swig-lispify "SF_FORMAT_OGG" 'enumvalue) #x200000)
	(#.(swig-lispify "SF_FORMAT_MPC2K" 'enumvalue) #x210000)
	(#.(swig-lispify "SF_FORMAT_RF64" 'enumvalue) #x220000)
	(#.(swig-lispify "SF_FORMAT_PCM_S8" 'enumvalue) #x0001)
	(#.(swig-lispify "SF_FORMAT_PCM_16" 'enumvalue) #x0002)
	(#.(swig-lispify "SF_FORMAT_PCM_24" 'enumvalue) #x0003)
	(#.(swig-lispify "SF_FORMAT_PCM_32" 'enumvalue) #x0004)
	(#.(swig-lispify "SF_FORMAT_PCM_U8" 'enumvalue) #x0005)
	(#.(swig-lispify "SF_FORMAT_FLOAT" 'enumvalue) #x0006)
	(#.(swig-lispify "SF_FORMAT_DOUBLE" 'enumvalue) #x0007)
	(#.(swig-lispify "SF_FORMAT_ULAW" 'enumvalue) #x0010)
	(#.(swig-lispify "SF_FORMAT_ALAW" 'enumvalue) #x0011)
	(#.(swig-lispify "SF_FORMAT_IMA_ADPCM" 'enumvalue) #x0012)
	(#.(swig-lispify "SF_FORMAT_MS_ADPCM" 'enumvalue) #x0013)
	(#.(swig-lispify "SF_FORMAT_GSM610" 'enumvalue) #x0020)
	(#.(swig-lispify "SF_FORMAT_VOX_ADPCM" 'enumvalue) #x0021)
	(#.(swig-lispify "SF_FORMAT_G721_32" 'enumvalue) #x0030)
	(#.(swig-lispify "SF_FORMAT_G723_24" 'enumvalue) #x0031)
	(#.(swig-lispify "SF_FORMAT_G723_40" 'enumvalue) #x0032)
	(#.(swig-lispify "SF_FORMAT_DWVW_12" 'enumvalue) #x0040)
	(#.(swig-lispify "SF_FORMAT_DWVW_16" 'enumvalue) #x0041)
	(#.(swig-lispify "SF_FORMAT_DWVW_24" 'enumvalue) #x0042)
	(#.(swig-lispify "SF_FORMAT_DWVW_N" 'enumvalue) #x0043)
	(#.(swig-lispify "SF_FORMAT_DPCM_8" 'enumvalue) #x0050)
	(#.(swig-lispify "SF_FORMAT_DPCM_16" 'enumvalue) #x0051)
	(#.(swig-lispify "SF_FORMAT_VORBIS" 'enumvalue) #x0060)
	(#.(swig-lispify "SF_ENDIAN_FILE" 'enumvalue) #x00000000)
	(#.(swig-lispify "SF_ENDIAN_LITTLE" 'enumvalue) #x10000000)
	(#.(swig-lispify "SF_ENDIAN_BIG" 'enumvalue) #x20000000)
	(#.(swig-lispify "SF_ENDIAN_CPU" 'enumvalue) #x30000000)
	(#.(swig-lispify "SF_FORMAT_SUBMASK" 'enumvalue) #x0000FFFF)
	(#.(swig-lispify "SF_FORMAT_TYPEMASK" 'enumvalue) #x0FFF0000)
	(#.(swig-lispify "SF_FORMAT_ENDMASK" 'enumvalue) #x30000000))

(defanonenum 
	(#.(swig-lispify "SFC_GET_LIB_VERSION" 'enumvalue) #x1000)
	(#.(swig-lispify "SFC_GET_LOG_INFO" 'enumvalue) #x1001)
	(#.(swig-lispify "SFC_GET_CURRENT_SF_INFO" 'enumvalue) #x1002)
	(#.(swig-lispify "SFC_GET_NORM_DOUBLE" 'enumvalue) #x1010)
	(#.(swig-lispify "SFC_GET_NORM_FLOAT" 'enumvalue) #x1011)
	(#.(swig-lispify "SFC_SET_NORM_DOUBLE" 'enumvalue) #x1012)
	(#.(swig-lispify "SFC_SET_NORM_FLOAT" 'enumvalue) #x1013)
	(#.(swig-lispify "SFC_SET_SCALE_FLOAT_INT_READ" 'enumvalue) #x1014)
	(#.(swig-lispify "SFC_SET_SCALE_INT_FLOAT_WRITE" 'enumvalue) #x1015)
	(#.(swig-lispify "SFC_GET_SIMPLE_FORMAT_COUNT" 'enumvalue) #x1020)
	(#.(swig-lispify "SFC_GET_SIMPLE_FORMAT" 'enumvalue) #x1021)
	(#.(swig-lispify "SFC_GET_FORMAT_INFO" 'enumvalue) #x1028)
	(#.(swig-lispify "SFC_GET_FORMAT_MAJOR_COUNT" 'enumvalue) #x1030)
	(#.(swig-lispify "SFC_GET_FORMAT_MAJOR" 'enumvalue) #x1031)
	(#.(swig-lispify "SFC_GET_FORMAT_SUBTYPE_COUNT" 'enumvalue) #x1032)
	(#.(swig-lispify "SFC_GET_FORMAT_SUBTYPE" 'enumvalue) #x1033)
	(#.(swig-lispify "SFC_CALC_SIGNAL_MAX" 'enumvalue) #x1040)
	(#.(swig-lispify "SFC_CALC_NORM_SIGNAL_MAX" 'enumvalue) #x1041)
	(#.(swig-lispify "SFC_CALC_MAX_ALL_CHANNELS" 'enumvalue) #x1042)
	(#.(swig-lispify "SFC_CALC_NORM_MAX_ALL_CHANNELS" 'enumvalue) #x1043)
	(#.(swig-lispify "SFC_GET_SIGNAL_MAX" 'enumvalue) #x1044)
	(#.(swig-lispify "SFC_GET_MAX_ALL_CHANNELS" 'enumvalue) #x1045)
	(#.(swig-lispify "SFC_SET_ADD_PEAK_CHUNK" 'enumvalue) #x1050)
	(#.(swig-lispify "SFC_SET_ADD_HEADER_PAD_CHUNK" 'enumvalue) #x1051)
	(#.(swig-lispify "SFC_UPDATE_HEADER_NOW" 'enumvalue) #x1060)
	(#.(swig-lispify "SFC_SET_UPDATE_HEADER_AUTO" 'enumvalue) #x1061)
	(#.(swig-lispify "SFC_FILE_TRUNCATE" 'enumvalue) #x1080)
	(#.(swig-lispify "SFC_SET_RAW_START_OFFSET" 'enumvalue) #x1090)
	(#.(swig-lispify "SFC_SET_DITHER_ON_WRITE" 'enumvalue) #x10A0)
	(#.(swig-lispify "SFC_SET_DITHER_ON_READ" 'enumvalue) #x10A1)
	(#.(swig-lispify "SFC_GET_DITHER_INFO_COUNT" 'enumvalue) #x10A2)
	(#.(swig-lispify "SFC_GET_DITHER_INFO" 'enumvalue) #x10A3)
	(#.(swig-lispify "SFC_GET_EMBED_FILE_INFO" 'enumvalue) #x10B0)
	(#.(swig-lispify "SFC_SET_CLIPPING" 'enumvalue) #x10C0)
	(#.(swig-lispify "SFC_GET_CLIPPING" 'enumvalue) #x10C1)
	(#.(swig-lispify "SFC_GET_INSTRUMENT" 'enumvalue) #x10D0)
	(#.(swig-lispify "SFC_SET_INSTRUMENT" 'enumvalue) #x10D1)
	(#.(swig-lispify "SFC_GET_LOOP_INFO" 'enumvalue) #x10E0)
	(#.(swig-lispify "SFC_GET_BROADCAST_INFO" 'enumvalue) #x10F0)
	(#.(swig-lispify "SFC_SET_BROADCAST_INFO" 'enumvalue) #x10F1)
	(#.(swig-lispify "SFC_GET_CHANNEL_MAP_INFO" 'enumvalue) #x1100)
	(#.(swig-lispify "SFC_SET_CHANNEL_MAP_INFO" 'enumvalue) #x1101)
	(#.(swig-lispify "SFC_RAW_DATA_NEEDS_ENDSWAP" 'enumvalue) #x1110)
	(#.(swig-lispify "SFC_WAVEX_SET_AMBISONIC" 'enumvalue) #x1200)
	(#.(swig-lispify "SFC_WAVEX_GET_AMBISONIC" 'enumvalue) #x1201)
	(#.(swig-lispify "SFC_SET_VBR_ENCODING_QUALITY" 'enumvalue) #x1300)
	(#.(swig-lispify "SFC_TEST_IEEE_FLOAT_REPLACE" 'enumvalue) #x6001)
	(#.(swig-lispify "SFC_SET_ADD_DITHER_ON_WRITE" 'enumvalue) #x1070)
	(#.(swig-lispify "SFC_SET_ADD_DITHER_ON_READ" 'enumvalue) #x1071))

(defanonenum 
	(#.(swig-lispify "SF_STR_TITLE" 'enumvalue) #x01)
	(#.(swig-lispify "SF_STR_COPYRIGHT" 'enumvalue) #x02)
	(#.(swig-lispify "SF_STR_SOFTWARE" 'enumvalue) #x03)
	(#.(swig-lispify "SF_STR_ARTIST" 'enumvalue) #x04)
	(#.(swig-lispify "SF_STR_COMMENT" 'enumvalue) #x05)
	(#.(swig-lispify "SF_STR_DATE" 'enumvalue) #x06)
	(#.(swig-lispify "SF_STR_ALBUM" 'enumvalue) #x07)
	(#.(swig-lispify "SF_STR_LICENSE" 'enumvalue) #x08))

(defanonenum 
	(#.(swig-lispify "SF_FALSE" 'enumvalue) 0)
	(#.(swig-lispify "SF_TRUE" 'enumvalue) 1)
	(#.(swig-lispify "SFM_READ" 'enumvalue) #x10)
	(#.(swig-lispify "SFM_WRITE" 'enumvalue) #x20)
	(#.(swig-lispify "SFM_RDWR" 'enumvalue) #x30)
	(#.(swig-lispify "SF_AMBISONIC_NONE" 'enumvalue) #x40)
	(#.(swig-lispify "SF_AMBISONIC_B_FORMAT" 'enumvalue) #x41))

(defanonenum 
	(#.(swig-lispify "SF_ERR_NO_ERROR" 'enumvalue) 0)
	(#.(swig-lispify "SF_ERR_UNRECOGNISED_FORMAT" 'enumvalue) 1)
	(#.(swig-lispify "SF_ERR_SYSTEM" 'enumvalue) 2)
	(#.(swig-lispify "SF_ERR_MALFORMED_FILE" 'enumvalue) 3)
	(#.(swig-lispify "SF_ERR_UNSUPPORTED_ENCODING" 'enumvalue) 4))

(defanonenum 
	(#.(swig-lispify "SF_CHANNEL_MAP_INVALID" 'enumvalue) 0)
	(#.(swig-lispify "SF_CHANNEL_MAP_MONO" 'enumvalue) 1)
	#.(swig-lispify "SF_CHANNEL_MAP_LEFT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_RIGHT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_CENTER" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_FRONT_LEFT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_FRONT_RIGHT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_FRONT_CENTER" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_REAR_CENTER" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_REAR_LEFT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_REAR_RIGHT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_LFE" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_FRONT_LEFT_OF_CENTER" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_FRONT_RIGHT_OF_CENTER" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_SIDE_LEFT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_SIDE_RIGHT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_TOP_CENTER" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_TOP_FRONT_LEFT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_TOP_FRONT_RIGHT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_TOP_FRONT_CENTER" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_TOP_REAR_LEFT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_TOP_REAR_RIGHT" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_TOP_REAR_CENTER" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_AMBISONIC_B_W" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_AMBISONIC_B_X" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_AMBISONIC_B_Y" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_AMBISONIC_B_Z" 'enumvalue)
	#.(swig-lispify "SF_CHANNEL_MAP_MAX" 'enumvalue))

(cl:defconstant #.(swig-lispify "SF_COUNT_MAX" 'constant) #x7FFFFFFFFFFFFFFF)

(cffi:defcstruct #.(swig-lispify "SF_INFO" 'classname)
	(#.(swig-lispify "frames" 'slotname) :pointer)
	(#.(swig-lispify "samplerate" 'slotname) :int)
	(#.(swig-lispify "channels" 'slotname) :int)
	(#.(swig-lispify "format" 'slotname) :int)
	(#.(swig-lispify "sections" 'slotname) :int)
	(#.(swig-lispify "seekable" 'slotname) :int))

(cffi:defcstruct #.(swig-lispify "SF_FORMAT_INFO" 'classname)
	(#.(swig-lispify "format" 'slotname) :int)
	(#.(swig-lispify "name" 'slotname) :string)
	(#.(swig-lispify "extension" 'slotname) :string))

(defanonenum 
	(#.(swig-lispify "SFD_DEFAULT_LEVEL" 'enumvalue) 0)
	(#.(swig-lispify "SFD_CUSTOM_LEVEL" 'enumvalue) #x40000000)
	(#.(swig-lispify "SFD_NO_DITHER" 'enumvalue) 500)
	(#.(swig-lispify "SFD_WHITE" 'enumvalue) 501)
	(#.(swig-lispify "SFD_TRIANGULAR_PDF" 'enumvalue) 502))

(cffi:defcstruct #.(swig-lispify "SF_DITHER_INFO" 'classname)
	(#.(swig-lispify "type" 'slotname) :int)
	(#.(swig-lispify "level" 'slotname) :double)
	(#.(swig-lispify "name" 'slotname) :string))

(cffi:defcstruct #.(swig-lispify "SF_EMBED_FILE_INFO" 'classname)
	(#.(swig-lispify "offset" 'slotname) :pointer)
	(#.(swig-lispify "length" 'slotname) :pointer))

(defanonenum 
	(#.(swig-lispify "SF_LOOP_NONE" 'enumvalue) 800)
	#.(swig-lispify "SF_LOOP_FORWARD" 'enumvalue)
	#.(swig-lispify "SF_LOOP_BACKWARD" 'enumvalue)
	#.(swig-lispify "SF_LOOP_ALTERNATING" 'enumvalue))

(cffi:defcstruct #.(swig-lispify "SF_INSTRUMENT" 'classname)
	(#.(swig-lispify "gain" 'slotname) :int)
	(#.(swig-lispify "basenote" 'slotname) :char)
	(#.(swig-lispify "detune" 'slotname) :char)
	(#.(swig-lispify "velocity_lo" 'slotname) :char)
	(#.(swig-lispify "velocity_hi" 'slotname) :char)
	(#.(swig-lispify "key_lo" 'slotname) :char)
	(#.(swig-lispify "key_hi" 'slotname) :char)
	(#.(swig-lispify "loop_count" 'slotname) :int)
	(#.(swig-lispify "loops" 'slotname) :pointer))

(cffi:defcstruct #.(swig-lispify "SF_INSTRUMENT_loops" 'classname)
	(#.(swig-lispify "mode" 'slotname) :int)
	(#.(swig-lispify "start" 'slotname) :unsigned-int)
	(#.(swig-lispify "end" 'slotname) :unsigned-int)
	(#.(swig-lispify "count" 'slotname) :unsigned-int))

(cffi:defcstruct #.(swig-lispify "SF_LOOP_INFO" 'classname)
	(#.(swig-lispify "time_sig_num" 'slotname) :short)
	(#.(swig-lispify "time_sig_den" 'slotname) :short)
	(#.(swig-lispify "loop_mode" 'slotname) :int)
	(#.(swig-lispify "num_beats" 'slotname) :int)
	(#.(swig-lispify "bpm" 'slotname) :float)
	(#.(swig-lispify "root_key" 'slotname) :int)
	(#.(swig-lispify "future" 'slotname) :pointer))

(cffi:defcstruct #.(swig-lispify "SF_BROADCAST_INFO" 'classname)
	(#.(swig-lispify "description" 'slotname) :pointer)
	(#.(swig-lispify "originator" 'slotname) :pointer)
	(#.(swig-lispify "originator_reference" 'slotname) :pointer)
	(#.(swig-lispify "origination_date" 'slotname) :pointer)
	(#.(swig-lispify "origination_time" 'slotname) :pointer)
	(#.(swig-lispify "time_reference_low" 'slotname) :unsigned-int)
	(#.(swig-lispify "time_reference_high" 'slotname) :unsigned-int)
	(#.(swig-lispify "version" 'slotname) :short)
	(#.(swig-lispify "umid" 'slotname) :pointer)
	(#.(swig-lispify "reserved" 'slotname) :pointer)
	(#.(swig-lispify "coding_history_size" 'slotname) :unsigned-int)
	(#.(swig-lispify "coding_history" 'slotname) :pointer))

(cffi:defcstruct #.(swig-lispify "SF_VIRTUAL_IO" 'classname)
	(#.(swig-lispify "get_filelen" 'slotname) :pointer)
	(#.(swig-lispify "seek" 'slotname) :pointer)
	(#.(swig-lispify "read" 'slotname) :pointer)
	(#.(swig-lispify "write" 'slotname) :pointer)
	(#.(swig-lispify "tell" 'slotname) :pointer))

(cffi:defcfun ("sf_open" #.(swig-lispify "sf_open" 'function)) :pointer
  (path :string)
  (mode :int)
  (sfinfo sf-info))

(cffi:defcfun ("sf_open_fd" #.(swig-lispify "sf_open_fd" 'function)) :pointer
  (fd :int)
  (mode :int)
  (sfinfo sf-info)
  (close_desc :int))

(cffi:defcfun ("sf_open_virtual" #.(swig-lispify "sf_open_virtual" 'function)) :pointer
  (sfvirtual :pointer)
  (mode :int)
  (sfinfo sf-info)
  (user_data :pointer))

(cffi:defcfun ("sf_error" #.(swig-lispify "sf_error" 'function)) :int
  (sndfile :pointer))

(cffi:defcfun ("sf_strerror" #.(swig-lispify "sf_strerror" 'function)) :string
  (sndfile :pointer))

(cffi:defcfun ("sf_error_number" #.(swig-lispify "sf_error_number" 'function)) :string
  (errnum :int))

(cffi:defcfun ("sf_perror" #.(swig-lispify "sf_perror" 'function)) :int
  (sndfile :pointer))

(cffi:defcfun ("sf_error_str" #.(swig-lispify "sf_error_str" 'function)) :int
  (sndfile :pointer)
  (str :string)
  (len :pointer))

(cffi:defcfun ("sf_command" #.(swig-lispify "sf_command" 'function)) :int
  (sndfile :pointer)
  (command :int)
  (data :pointer)
  (datasize :int))

(cffi:defcfun ("sf_format_check" #.(swig-lispify "sf_format_check" 'function)) :int
  (info sf-info))

(cffi:defcfun ("sf_seek" #.(swig-lispify "sf_seek" 'function)) :pointer
  (sndfile :pointer)
  (frames :pointer)
  (whence :int))

(cffi:defcfun ("sf_set_string" #.(swig-lispify "sf_set_string" 'function)) :int
  (sndfile :pointer)
  (str_type :int)
  (str :string))

(cffi:defcfun ("sf_get_string" #.(swig-lispify "sf_get_string" 'function)) :string
  (sndfile :pointer)
  (str_type :int))

(cffi:defcfun ("sf_version_string" #.(swig-lispify "sf_version_string" 'function)) :string)

(cffi:defcfun ("sf_read_raw" #.(swig-lispify "sf_read_raw" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (bytes :pointer))

(cffi:defcfun ("sf_write_raw" #.(swig-lispify "sf_write_raw" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (bytes :pointer))

(cffi:defcfun ("sf_readf_short" #.(swig-lispify "sf_readf_short" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (frames :pointer))

(cffi:defcfun ("sf_writef_short" #.(swig-lispify "sf_writef_short" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (frames :pointer))

(cffi:defcfun ("sf_readf_int" #.(swig-lispify "sf_readf_int" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (frames :pointer))

(cffi:defcfun ("sf_writef_int" #.(swig-lispify "sf_writef_int" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (frames :pointer))

(cffi:defcfun ("sf_readf_float" #.(swig-lispify "sf_readf_float" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (frames :pointer))

(cffi:defcfun ("sf_writef_float" #.(swig-lispify "sf_writef_float" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (frames :pointer))

(cffi:defcfun ("sf_readf_double" #.(swig-lispify "sf_readf_double" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (frames :pointer))

(cffi:defcfun ("sf_writef_double" #.(swig-lispify "sf_writef_double" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (frames :pointer))

(cffi:defcfun ("sf_read_short" #.(swig-lispify "sf_read_short" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (items :pointer))

(cffi:defcfun ("sf_write_short" #.(swig-lispify "sf_write_short" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (items :pointer))

(cffi:defcfun ("sf_read_int" #.(swig-lispify "sf_read_int" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (items :pointer))

(cffi:defcfun ("sf_write_int" #.(swig-lispify "sf_write_int" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (items :pointer))

(cffi:defcfun ("sf_read_float" #.(swig-lispify "sf_read_float" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (items :pointer))

(cffi:defcfun ("sf_write_float" #.(swig-lispify "sf_write_float" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (items :pointer))

(cffi:defcfun ("sf_read_double" #.(swig-lispify "sf_read_double" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (items :pointer))

(cffi:defcfun ("sf_write_double" #.(swig-lispify "sf_write_double" 'function)) :pointer
  (sndfile :pointer)
  (ptr :pointer)
  (items :pointer))

(cffi:defcfun ("sf_close" #.(swig-lispify "sf_close" 'function)) :int
  (sndfile :pointer))

(cffi:defcfun ("sf_write_sync" #.(swig-lispify "sf_write_sync" 'function)) :void
  (sndfile :pointer))


