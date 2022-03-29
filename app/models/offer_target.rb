require 'utils'

class OfferTarget < ApplicationRecord
  include Utils

  belongs_to :offer
  belongs_to :operating_system
  belongs_to :locale
  belongs_to :gender

  def OfferTarget.total_payout(min_age=14, max_age=150)
    query_total_payout_in_cents = <<-SQL
      select sum(o.payout_cents) as total_payout_in_cents
      FROM offers o
      INNER JOIN (
        select offer_id, player_id from offer_targets ot
        inner join players p ON
        p.birthdate between
          CURRENT_DATE - INTERVAL '1 year' * ot.max_player_age AND
          CURRENT_DATE - INTERVAL '1 year' * ot.min_player_age
        inner join devices d ON
        d.player_id = p.id AND
        p.gender_id = ot.gender_id AND
        d.operating_system_id = ot.operating_system_id AND
        d.locale_id = ot.locale_id AND
        (d.os_major_version > ot.min_os_major_version
        OR
        (d.os_major_version = ot.min_os_major_version AND
          d.os_minor_version > ot.min_os_minor_version)
        OR
        (d.os_major_version = ot.min_os_major_version AND
          d.os_minor_version = ot.min_os_minor_version AND
          d.os_patch_version >= ot.min_os_patch_version))
        WHERE p.birthdate between
          CURRENT_DATE - INTERVAL '1 year' * #{max_age} AND
          CURRENT_DATE - INTERVAL '1 year' * #{min_age}
      ) matching_offers ON matching_offers.offer_id = o.id
SQL

    result = ActiveRecord::Base.connection.exec_query(query_total_payout_in_cents)
    key,value = result.first.first
    return Money.us_dollar(value).format
  end

end
