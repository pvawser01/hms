# hms


## Description

A basic application to simulate the management of patients and bed availability within a hospital.

## Installation

Install gem dependencies with Bundle:

    $ bundle install

## Usage


## Testing


## Specification

### Description

In this excercise we'd like you to design a simple rails app, doesn't need a
front end just a set of models and modules with a test suite that demonstrates 
the fulfilled requirements

A hospital has been finding that they have been having great difficulty in
managing their patients, and after a couple of bed mix ups they decide they
need a system to help manage the hospital, you have been tasked with developing
this system.

  In the hospital are a couple of different concepts

    Ward
      A wing of the hospital that handles specific patient types, as defined
      by [EMERGENCY, INFECTIOUS, RECOVERY, STABLE].
    Room
      A section of the ward were patients are housed whilst they are being
      treated.

    Bed
      The specific bed that a patient occupies.

    Patient
      The actual patient that each patient, a patient is designated a category
      [EMERGENCY, INFECTIOUS, RECOVERY, STABLE]. which determines what kind of
      ward they can be assigned to.

    A ward can contain many rooms
    A ward can only accepts patient of a certain type
    A room can contain many beds
    A bed can only have one patient at a time
    A room can only have 4 beds in it at any particular time

    Patient who is assigned to a bed may be transferred between rooms,
    either they take their bed with them or they are assigned to another vacant
    bed. Your solution should provide an interface to facilitate this.


