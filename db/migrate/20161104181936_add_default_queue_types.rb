class AddDefaultQueueTypes < ActiveRecord::Migration
  def self.up
    TeamConfig.create({
                          :description => '2 support, 2 tank, 2 DPS',
                          :num_support => 2,
                          :num_tank    => 2,
                          :num_DPS     => 2
                      })
  end
end
