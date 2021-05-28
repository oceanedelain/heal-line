const initBoldCollapse = () => {
  const doctors = document.querySelectorAll(".doctor");
  if (doctors)  {
    doctors.forEach(doctor => {
      const collapse = doctor.querySelector(".collapse");
      const text = doctor.querySelector("h5");
      text.addEventListener("click", (e) => {
        document.querySelectorAll("h5").forEach(d => d.classList.remove("font-weight-bold"));
        if (collapse.classList.contains("show")) {
          text.classList.remove("font-weight-bold");
        } else {
          text.classList.add("font-weight-bold");
        };
      });
    });
  }
};

export { initBoldCollapse };
