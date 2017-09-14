class Api::V1::AuthController < ApplicationController
  before_action :authorize_user!, only: [:show]
