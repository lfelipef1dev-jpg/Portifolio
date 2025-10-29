// Filtro de menu
document.querySelectorAll('.menu-tab').forEach(tab => {
    tab.addEventListener('click', function() {
        document.querySelectorAll('.menu-tab').forEach(t => t.classList.remove('active'));
        this.classList.add('active');
        
        const category = this.getAttribute('data-category');
        const items = document.querySelectorAll('.menu-item');
        
        items.forEach(item => {
            if (category === 'all' || item.getAttribute('data-category') === category) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });
    });
});

// Formulário de reserva
document.querySelector('.reservation-form')?.addEventListener('submit', function(e) {
    e.preventDefault();
    alert('Reserva realizada com sucesso! Entraremos em contato para confirmar.');
    this.reset();
});

