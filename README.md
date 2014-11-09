# Vimperor

[![Build Status](https://travis-ci.org/mxhold/vimperor.svg?branch=master)](https://travis-ci.org/mxhold/vimperor) [![Code Climate](https://codeclimate.com/github/mxhold/vimperor/badges/gpa.svg)](https://codeclimate.com/github/mxhold/vimperor) [![Test Coverage](https://codeclimate.com/github/mxhold/vimperor/badges/coverage.svg)](https://codeclimate.com/github/mxhold/vimperor)

Vimperor is a `.vimrc` generator that lets you configure Vim without having to
know everything about Vim.

See it live at [vimperor.herokuapp.com](http://vimperor.herokuapp.com/)

# Development setup

To run Vimperor locally, you'll need git, Ruby 2.1.4, and PostgreSQL installed.

1. Clone this repository:

`git clone git@github.com:mxhold/vimperor.git`

2. Run the setup script:

`bin/setup`

This installs them gems, sets up your database, and runs the tests.

If you see "Setup complete!" everything worked.

3. Start the server:

`rails server`

4. Done! The application should be up and running on
   [http://localhost:3000/](http://localhost:3000/)
