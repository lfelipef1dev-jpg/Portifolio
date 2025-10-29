// ============================================
// FORMULÁRIO DE CONTATO (Melhorado)
// ============================================
function initContactForm() {
    // A função initFormHandler já existe e funciona
    // Esta função é apenas para Analytics e melhorias opcionais
    const form = document.getElementById('contact-form');
    if (!form) return;
    
    // Analytics tracking
    form.addEventListener('submit', function() {
        if (typeof gtag !== 'undefined') {
            gtag('event', 'form_submit', {
                'event_category': 'Contact',
                'event_label': 'Contact Form'
            });
        }
    });
}

// ============================================
// NAVEGAÇÃO SUAVE
// ============================================
function initSmoothScroll() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            
            if (href === '#' || href === '') return;
            
            e.preventDefault();
            
            const targetId = href.substring(1);
            const targetElement = document.getElementById(targetId);
            
            if (targetElement) {
                // Se for a seção home, scroll até o topo
                if (targetId === 'home') {
                    window.scrollTo({
                        top: 0,
                        behavior: 'smooth'
                    });
                    return;
                }
                
                // Para outras seções, calcular com offset do header
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

// ============================================
// MENU MOBILE
// ============================================
function openMobileMenu() {
    const nav = document.getElementById('mobile-nav');
    const overlay = document.getElementById('mobile-nav-overlay');
    const toggle = document.getElementById('mobile-menu-toggle');
    
    if (nav) {
        nav.classList.add('open');
        nav.style.display = 'block';
        nav.style.transform = 'translateX(0)';
        nav.setAttribute('aria-hidden', 'false');
    }
    
    if (overlay) {
        overlay.classList.add('active');
        overlay.style.display = 'block';
    }
    
    if (toggle) {
        toggle.classList.add('open');
        toggle.setAttribute('aria-expanded', 'true');
    }
    
    document.body.style.overflow = 'hidden';
}

function closeMobileMenu() {
    const nav = document.getElementById('mobile-nav');
    const overlay = document.getElementById('mobile-nav-overlay');
    const toggle = document.getElementById('mobile-menu-toggle');
    
    if (nav) {
        nav.classList.remove('open');
        nav.style.transform = 'translateX(110%)';
        nav.setAttribute('aria-hidden', 'true');
    }
    
    if (overlay) {
        overlay.classList.remove('active');
        overlay.style.display = 'none';
    }
    
    if (toggle) {
        toggle.classList.remove('open');
        toggle.setAttribute('aria-expanded', 'false');
    }
    
    document.body.style.overflow = 'auto';
}

function initMobileMenu() {
    const toggle = document.getElementById('mobile-menu-toggle');
    const overlay = document.getElementById('mobile-nav-overlay');
    const nav = document.getElementById('mobile-nav');
    
    if (!toggle || !nav || !overlay) return;
    
    toggle.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        
        const isOpen = nav.classList.contains('open');
        
        if (isOpen) {
            closeMobileMenu();
        } else {
            openMobileMenu();
        }
    });
    
    overlay.addEventListener('click', closeMobileMenu);
    
    // Fechar ao clicar em links do menu mobile
    const navLinks = nav.querySelectorAll('a');
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            closeMobileMenu();
            
            // Scroll após fechar menu
            setTimeout(() => {
                const targetId = this.getAttribute('href').substring(1);
                const targetElement = document.getElementById(targetId);
                
                if (targetElement) {
                    // Se for home, scroll até o topo
                    if (targetId === 'home') {
                        window.scrollTo({ 
                            top: 0, 
                            behavior: 'smooth' 
                        });
                        return;
                    }
                    
                    // Para outras seções, calcular com offset do header
                    const headerHeight = document.querySelector('.header')?.offsetHeight || 0;
                    const targetPosition = targetElement.offsetTop - headerHeight;
                    window.scrollTo({ 
                        top: targetPosition, 
                        behavior: 'smooth' 
                    });
                }
            }, 300);
        });
    });
    
    // Fechar com ESC
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && nav.classList.contains('open')) {
            closeMobileMenu();
        }
    });
}

// ============================================
// CONTADORES ANIMADOS
// ============================================
function animateCounter(element, target) {
    const duration = 2000;
    const steps = 60;
    const increment = target / steps;
    const interval = duration / steps;
    let current = 0;
    
    const timer = setInterval(() => {
        current += increment;
        
        if (current >= target) {
            element.textContent = target;
            clearInterval(timer);
        } else {
            element.textContent = Math.floor(current);
        }
    }, interval);
}

function initCounters() {
    const counters = document.querySelectorAll('.counter');
    
    if (counters.length === 0) return;
    
    const observerOptions = {
        threshold: 0.7,
        rootMargin: '0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting && !entry.target.dataset.animated) {
                entry.target.dataset.animated = 'true';
                const target = parseInt(entry.target.getAttribute('data-target'));
                
                if (!isNaN(target) && target > 0) {
                    animateCounter(entry.target, target);
                }
            }
        });
    }, observerOptions);
    
    counters.forEach(counter => {
        observer.observe(counter);
    });
}

// ============================================
// FORMULÁRIO DE CONTATO
// ============================================
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function showFormMessage(form, type, message) {
    const existingMessage = form.querySelector('.form-message');
    if (existingMessage) {
        existingMessage.remove();
    }
    
    const messageDiv = document.createElement('div');
    messageDiv.className = `form-message form-message--${type}`;
    messageDiv.textContent = message;
    messageDiv.setAttribute('role', 'alert');
    
    const submitButton = form.querySelector('button[type="submit"]');
    form.insertBefore(messageDiv, submitButton);
    
    setTimeout(() => {
        messageDiv.remove();
    }, 5000);
}

function initFormHandler() {
    const form = document.getElementById('contact-form');
    
    if (!form) return;
    
    // Usar action do form se existir (Formspree)
    const formAction = form.getAttribute('action');
    if (formAction && formAction.includes('formspree.io')) {
        form.addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const submitBtn = form.querySelector('button[type="submit"]');
            const originalText = submitBtn.innerHTML;
            
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Enviando...';
            
            const formData = new FormData(form);
            
            try {
                const response = await fetch(formAction, {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'Accept': 'application/json'
                    }
                });
                
                if (response.ok) {
                    showFormMessage(form, 'success', 'Mensagem enviada com sucesso! Entrarei em contato em breve.');
                    form.reset();
                    
                    if (typeof gtag !== 'undefined') {
                        gtag('event', 'form_submit', {
                            'event_category': 'Contact',
                            'event_label': 'Contact Form'
                        });
                    }
                } else {
                    throw new Error('Erro ao enviar');
                }
            } catch (error) {
                showFormMessage(form, 'error', 'Erro ao enviar. Redirecionando para WhatsApp...');
                setTimeout(() => {
                    const message = encodeURIComponent('Olá! Gostaria de entrar em contato.');
                    window.open(`https://wa.me/5513996586963?text=${message}`, '_blank');
                }, 1000);
            } finally {
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalText;
            }
        });
    } else {
        // Fallback para função original
        form.addEventListener('submit', handleFormSubmit);
    }
}

// ============================================
// BOTÕES DE SERVIÇOS (WhatsApp)
// ============================================
function initServiceButtons() {
    const serviceButtons = document.querySelectorAll('.service-btn');
    
    serviceButtons.forEach(button => {
        button.addEventListener('click', function() {
            const service = this.getAttribute('data-service');
            const serviceNames = {
                'landing-page': 'Landing Page',
                'site-profissional': 'Site Profissional',
                'consultoria': 'Consultoria Digital',
                'site-premium': 'Site Premium',
                'ecommerce': 'E-commerce',
                'mobile-app': 'Aplicativo Mobile',
                'sistemas': 'Sistemas Personalizados'
            };
            
            const serviceName = serviceNames[service] || 'Serviço';
            const message = encodeURIComponent(
                `Olá! Gostaria de solicitar um orçamento para: ${serviceName}`
            );
            
            const whatsappUrl = `https://wa.me/5513996586963?text=${message}`;
            window.open(whatsappUrl, '_blank');
        });
    });
}

// ============================================
// ATUALIZAR ANO NO FOOTER
// ============================================
function updateFooterYear() {
    const yearElement = document.getElementById('current-year');
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear();
    }
}

// ============================================
// INICIALIZAÇÃO
// ============================================
document.addEventListener('DOMContentLoaded', function() {
    initSmoothScroll();
    initMobileMenu();
    initCounters();
    initFormHandler();
    initServiceButtons();
    initContactForm();
    initProjectModals();
    updateFooterYear();
});

