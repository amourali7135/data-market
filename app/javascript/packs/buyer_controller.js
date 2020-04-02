
// # Ray infinite pagination attempt
const buyerController = {
  container: document.querySelector(".container"),
  postsContainer: document.getElementById("buyers-container"),
  moreBtn: document.getElementById("more-btn"),
  insertItems(items) {
    this.postsContainer.insertAdjacentHTML("beforeend", items);
  },
  setNextPage(nextPage) {
    const url = new URL(this.moreBtn.href);
    url.search = `?page=${nextPage}`;
    this.moreBtn.setAttribute("href", url.search);
  },
  attachInfiniteScroll() {
    if (this.moreBtn) {
      this.container.addEventListener("scroll", () => {
        if (
          this.container.scrollTop + this.container.clientHeight >=
          this.container.scrollHeight
          ) {
            this.moreBtn.click();
          }
        });
      }
    }
  };

  buyerController.attachInfiniteScroll();

  global.buyerController = buyerController;


  // # Ray infinite pagination attempt
