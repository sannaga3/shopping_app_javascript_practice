class Money < ApplicationRecord
  belongs_to :wallet
  before_validation :check_wallet_money

  # 所持金を減らす際にマイナスにならないかチェックする
  def check_wallet_money
    reduce_money = self.yen                                                   # createする予定のインスタンスのyenを取得
    total_money_elements = Money.where(wallet_id: self.wallet.id).pluck(:yen) # 今までのMoneyの増減履歴をyenカラムのみ全て取得
    total_money = total_money_elements.inject(:+)                             # 配列内の要素を全て足して所持金合計を出す
    if reduce_money + total_money < 0                                         # 所持金よりも今回減らす額が大きければエラーを出力
      errors.add("円", "はマイナスにならない値を入力して下さい。")
    end
  end
end
