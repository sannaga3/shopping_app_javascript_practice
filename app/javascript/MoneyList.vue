<template>
  <div>
    <div class="d-flex flex-row my-1">
      <div class="mx-3 pt-2" style="min-width: 50px;">番号</div>
      <div class="mx-3 pt-2" style="min-width: 200px;">日時</div>
      <div class="mx-3 pt-2" style="min-width: 50px;">入出金</div>
      <div class="mx-3 pt-2" style="min-width: 100px;">備考</div>
    </div>
    <div v-for="money in moneyList" :key="money.id">
      <div class="d-flex flex-row my-1">
        <div class="mx-3 pt-2" style="min-width: 50px;">{{ money.number}}</div>
        <div class="mx-3 pt-2" style="min-width: 200px;">{{ money.created_at }}</div>
        <div class="mx-3 pt-2" style="min-width: 50px;">{{ money.yen }}</div>
        <div class="mx-3 pt-2" style="min-width: 100px;">{{ money.remarks }}</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: { money_histries: Array },
  data() {
    return {
      moneyList: [],
      listCount: 0,
      createdElement: "",
      createdElements: [],
      created: ""
    }
  },
  created() {
    this.listCount = this.money_histries.length
    for(let i = 0; i < this.money_histries.length; i++) {
      this.createdElement = this.money_histries[i].created_at
      this.createdElements = this.createdElement.match(/(\d{4})-(\d{2})-(\d{2})T(\d{2}:\d{2}):\d{2}/)
      this.created = this.createdElements[1] + "/" + this.createdElements[2] + "/" + this.createdElements[3] + " " + this.createdElements[4]
      this.moneyList.push({
                            number: this.listCount - i,
                            created_at: this.created,
                            yen: this.money_histries[i].yen,
                            remarks: this.money_histries[i].remarks,
                          });
    }
  }
}
</script>