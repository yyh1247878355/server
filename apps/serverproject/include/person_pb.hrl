%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.20.0

-ifndef(person_pb).
-define(person_pb, true).

-define(person_pb_gpb_version, "4.20.0").


-ifndef('PERSON_PB_H').
-define('PERSON_PB_H', true).
-record('Person',
        {name                   :: unicode:chardata() | undefined, % = 1, required
         id                     :: integer() | undefined, % = 2, required, 32 bits
         email                  :: unicode:chardata() | undefined % = 3, optional
        }).
-endif.

-endif.