class Payr::Bill < ActiveRecord::Base
  UNPROCESSED = "unprocessed"
  PAID = "paid"
  REFUSED = "refused"
  CANCELLED = "cancelled"
  SIGN_ERROR = "bad_signature"
  NO_ERROR = "00000"
end
