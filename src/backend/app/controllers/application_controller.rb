class ApplicationController < ActionController::API
  # すべてのコントローラにHttpDealerをincludeする
  include HttpDealer
end
