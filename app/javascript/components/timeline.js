const toggleTimelineCard = () => {
  if (document.querySelector('.timeline')) {
    const cards = document.querySelectorAll(".timeline-card");
    cards.forEach((card) => {
      card.addEventListener("click", (event) => {
        // select elements which have class open
        const openedCards = document.querySelectorAll(".open");
        Array.from(openedCards).filter(item => item !== event.currentTarget).forEach((c) => {
          // remove class open
          c.classList.remove('open');
        });
        event.currentTarget.classList.toggle('open');
      })

    })
  }
};

export { toggleTimelineCard };
