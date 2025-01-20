parameter   MIN_SEC         = 2'b01,
              HOUR_MIN        = 2'b10;

//SELMODE
parameter SET_TIME        = 5'b00001,
            TIME            = 5'b00010,
            ALARM           = 5'b00100,
            KITCHEN         = 5'b01000,
            STOPWATCH       = 5'b10000;

//SET_TIME
parameter   BASE      = 7'b0000001,
            HOUR10    = 7'b0000010,
            HOUR1     = 7'b0000100,
            MIN10     = 7'b0001000,
            MIN1      = 7'b0010000,
            SEC10     = 7'b0100000,
            SEC1      = 7'b1000000;

parameter   ALARM_OFF         = 2'b01,
            ALARM_ON          = 2'b10;

parameter   ALARM_DURING         = 2'b01,
            NOT_ALARM_DURING     = 2'b10;