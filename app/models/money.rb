class Money < ApplicationRecord
  belongs_to :wallet
  before_validation :check_wallet_money

  # 所持金を減らす際にマイナスにならないかチェックする
  def check_wallet_money
    reduce_money = self.yen                                                   # createする予定のインスタンスのyenを取得
    errors.add("金額欄", "が未入力です") and return if reduce_money == nil       # 金額が入力されていなかった場合のエラー
    total_money_elements = Money.where(wallet_id: self.wallet.id).pluck(:yen) # 今までのMoneyの増減履歴をyenカラムのみ全て取得
    total_money = total_money_elements.inject(:+)                             # 配列内の要素を全て足して所持金合計を出す
    if reduce_money + total_money < 0                                         # 所持金よりも今回減らす額が大きければエラーを出力
      errors.add("所持金", "がマイナスにならない値を入力して下さい。")
    end
  end
end
