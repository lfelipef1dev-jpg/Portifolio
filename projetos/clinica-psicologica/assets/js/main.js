// ============================================
// NAVEGAÇÃO SUAVE E MOBILE MENU
// ============================================
document.addEventListener('DOMContentLoaded', function() {
    initSmoothScroll();
    initMobileMenu();
    initAppointmentForm();
    initContactForm();
    initDatePicker();
    initFAQ();
    updateFooterYear();
});

function initSmoothScroll() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            
            if (href === '#' || href === '') return;
            
            e.preventDefault();
            
            const targetId = href.substring(1);
            
            // Se for home, scroll até o topo
            if (targetId === 'home') {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
                return;
            }
            
            const targetElement = document.getElementById(targetId);
            
            if (targetElement) {
                const headerHeight = document.querySelector('.header')?.offsetHeight || 0;
                const targetPosition = targetElement.offsetTop - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });
}

function initMobileMenu() {
    const toggle = document.getElementById('mobile-menu-toggle');
    const nav = document.getElementById('mobile-nav');
    
    if (!toggle || !nav) return;
    
    toggle.addEventListener('click', function() {
        const isOpen = nav.style.display === 'block';
        nav.style.display = isOpen ? 'none' : 'block';
        toggle.classList.toggle('active');
    });
    
    // Fechar ao clicar em link
    const navLinks = nav.querySelectorAll('a');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            nav.style.display = 'none';
            toggle.classList.remove('active');
        });
    });
}

// ============================================
// FORMULÁRIO DE AGENDAMENTO
// ============================================
function initAppointmentForm() {
    const form = document.getElementById('appointment-form');
    if (!form) return;
    
    form.addEventListener('submit', handleAppointmentSubmit);
    
    // Validar telefone em tempo real
    const phoneInput = document.getElementById('patient-phone');
    if (phoneInput) {
        phoneInput.addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length <= 11) {
                if (value.length <= 10) {
                    value = value.replace(/(\d{2})(\d{4})(\d{0,4})/, '($1) $2-$3');
                } else {
                    value = value.replace(/(\d{2})(\d{5})(\d{0,4})/, '($1) $2-$3');
                }
                e.target.value = value;
            }
        });
    }
}

function handleAppointmentSubmit(e) {
    e.preventDefault();
    
    const form = e.target;
    const submitButton = form.querySelector('button[type="submit"]');
    const originalText = submitButton.innerHTML;
    
    // Desabilitar botão
    submitButton.disabled = true;
    submitButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Agendando...';
    
    // Coletar dados
    const formData = {
        name: form.querySelector('#patient-name').value.trim(),
        email: form.querySelector('#patient-email').value.trim(),
        phone: form.querySelector('#patient-phone').value.trim(),
        psychologist: form.querySelector('#psychologist').value,
        date: form.querySelector('#appointment-date').value,
        time: form.querySelector('#appointment-time').value,
        message: form.querySelector('#message').value.trim()
    };
    
    // Validação
    if (!validateAppointmentForm(formData)) {
        showMessage(form, 'error', 'Por favor, preencha todos os campos obrigatórios.');
        submitButton.disabled = false;
        submitButton.innerHTML = originalText;
        return;
    }
    
    // Simular envio (aqui você integraria com backend)
    setTimeout(() => {
        showMessage(form, 'success', 'Agendamento realizado com sucesso! Você receberá um e-mail de confirmação em breve.');
        form.reset();
        
        // Redirecionar para WhatsApp com dados do agendamento
        const whatsappMessage = encodeURIComponent(
            `Olá! Realizei um agendamento:\n\n` +
            `Nome: ${formData.name}\n` +
            `Psicólogo: ${formData.psychologist}\n` +
            `Data: ${formatDate(formData.date)}\n` +
            `Horário: ${formData.time}\n\n` +
            `Aguardando confirmação.`
        );
        
        setTimeout(() => {
            window.open(`https://wa.me/5511999999999?text=${whatsappMessage}`, '_blank');
        }, 2000);
        
        submitButton.disabled = false;
        submitButton.innerHTML = originalText;
    }, 1500);
}

function validateAppointmentForm(data) {
    if (!data.name || data.name.length < 3) return false;
    if (!data.email || !isValidEmail(data.email)) return false;
    if (!data.phone || data.phone.length < 14) return false;
    if (!data.psychologist) return false;
    if (!data.date) return false;
    if (!data.time) return false;
    return true;
}

// ============================================
// FORMULÁRIO DE CONTATO
// ============================================
function initContactForm() {
    const form = document.getElementById('contact-form');
    if (!form) return;
    
    form.addEventListener('submit', handleContactSubmit);
}

function handleContactSubmit(e) {
    e.preventDefault();
    
    const form = e.target;
    const submitButton = form.querySelector('button[type="submit"]');
    const originalText = submitButton.innerHTML;
    
    submitButton.disabled = true;
    submitButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Enviando...';
    
    const formData = {
        name: form.querySelector('#contact-name').value.trim(),
        email: form.querySelector('#contact-email').value.trim(),
        subject: form.querySelector('#contact-subject').value.trim(),
        message: form.querySelector('#contact-message').value.trim()
    };
    
    // Validação
    if (!formData.name || !formData.email || !formData.subject || !formData.message) {
        showMessage(form, 'error', 'Por favor, preencha todos os campos.');
        submitButton.disabled = false;
        submitButton.innerHTML = originalText;
        return;
    }
    
    // Simular envio
    setTimeout(() => {
        showMessage(form, 'success', 'Mensagem enviada com sucesso! Entraremos em contato em breve.');
        form.reset();
        submitButton.disabled = false;
        submitButton.innerHTML = originalText;
    }, 1500);
}

// ============================================
// DATE PICKER - Definir data mínima (hoje)
// ============================================
function initDatePicker() {
    const dateInput = document.getElementById('appointment-date');
    if (!dateInput) return;
    
    const today = new Date();
    const tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);
    
    const minDate = tomorrow.toISOString().split('T')[0];
    dateInput.setAttribute('min', minDate);
}

// ============================================
// UTILITÁRIOS
// ============================================
function isValidEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('pt-BR', {
        weekday: 'long',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
    });
}

function showMessage(form, type, message) {
    // Remover mensagem anterior
    const existingMessage = form.querySelector('.form-message');
    if (existingMessage) {
        existingMessage.remove();
    }
    
    // Criar nova mensagem
    const messageDiv = document.createElement('div');
    messageDiv.className = `form-message form-message--${type}`;
    messageDiv.textContent = message;
    messageDiv.setAttribute('role', 'alert');
    
    // Inserir antes do botão de submit
    const submitButton = form.querySelector('button[type="submit"]');
    form.insertBefore(messageDiv, submitButton);
    
    // Scroll para mensagem
    messageDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    
    // Remover após 5 segundos
    setTimeout(() => {
        messageDiv.remove();
    }, 5000);
}

function updateFooterYear() {
    const yearElement = document.getElementById('current-year');
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear();
    }
}

// ============================================
// FAQ ACORDEON
// ============================================
function initFAQ() {
    const faqQuestions = document.querySelectorAll('.faq-question');
    
    faqQuestions.forEach(question => {
        question.addEventListener('click', function() {
            const faqItem = this.closest('.faq-item');
            const answer = faqItem.querySelector('.faq-answer');
            const icon = this.querySelector('i');
            const isOpen = answer.style.display === 'block';
            
            // Fechar todas as outras
            document.querySelectorAll('.faq-answer').forEach(a => {
                a.style.display = 'none';
            });
            document.querySelectorAll('.faq-question i').forEach(i => {
                i.style.transform = 'rotate(0deg)';
            });
            
            // Abrir/fechar a atual
            if (!isOpen) {
                answer.style.display = 'block';
                icon.style.transform = 'rotate(180deg)';
            }
        });
    });
}

// ============================================
// INTERSECTION OBSERVER - Animações ao scroll
// ============================================
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('fade-in');
            observer.unobserve(entry.target);
        }
    });
}, observerOptions);

// Observar elementos
document.addEventListener('DOMContentLoaded', function() {
    const animateElements = document.querySelectorAll('.service-card, .team-card, .about-content, .contact-item');
    animateElements.forEach(el => observer.observe(el));
});

