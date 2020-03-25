// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "inquiryInput", "seller" ]

  connect() {
    this.ids = []
  }

  toggleAll(event) {
    if (event.target.checked) { // add all ids
      this.ids = this.allIds
      this.inputTarget.value = this.ids
    } 
    else { // remove all
      this.ids = []
      this.inputTarget.value = ""
    }
  }

  toggleSeller(event) {
    const seller = event.target
    if (seller.checked) {
      this.ids.push(seller.value)
    } else {
      const index = this.ids.indexOf(seller.value);
      if (index !== -1) this.ids.splice(index, 1);
    }
    this.inputTarget.value = this.ids
  }

  selectInquiry(event) {
    const radioBtn = event.target
    if (radioBtn.checked) {
      this.inquiryInputTarget.value = radioBtn.value
    }
  }

  get allIds() {
    if (this.sellerTargets && this.sellerTargets.length > 0) {
      return this.sellerTargets.map(seller => seller.value)
    } else {
      return []
    }
  }
}
