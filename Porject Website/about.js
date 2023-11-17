window.onscroll = () => {
  aside.forEach((sec) => {
    let top = window.scrollY;
    let offset = sec.offsetTop - 150;
    let height = sec.offsetHeight;

    if (top >= offset && top < offset + height) {
      sec.classList.add("show-animate");
    } else {
      //for repeating animation on scroll, use this
      sec.classList.remove("show-animate");
    }
  });
};

function toggleMobileMenu(menu) {
  menu.classList.toggle("open");
}
