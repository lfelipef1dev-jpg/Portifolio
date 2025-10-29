// ============================================
// MODALS DE DETALHES DOS PROJETOS
// ============================================

const projectDetails = {
    'clinica-psicologica': {
        title: 'Clínica Psicológica - Mente Saudável',
        description: 'Sistema completo para clínica de psicologia com agendamento online, área do paciente e gestão de profissionais.',
        challenge: 'Criar uma plataforma segura e intuitiva para pacientes agendarem consultas online, com sistema de confirmação e lembretes automáticos.',
        solution: 'Desenvolvi um sistema completo com React e Node.js, incluindo validação de horários, calendário dinâmico, área do paciente com histórico de consultas, e integração com WhatsApp para confirmações.',
        technologies: ['React', 'Node.js', 'MongoDB', 'Express', 'JWT'],
        results: [
            'Aumento de 150% em agendamentos online',
            'Redução de 80% em faltas através de lembretes',
            'Tempo de resposta ao cliente reduzido em 90%'
        ],
        image: 'https://images.pexels.com/photos/4167544/pexels-photo-4167544.jpeg?auto=compress&cs=tinysrgb&w=1200',
        github: 'https://github.com/seu-usuario/clinica-psicologica',
        live: 'projetos/clinica-psicologica/index.html'
    },
    'ecommerce-fashion': {
        title: 'E-commerce Fashion Store',
        description: 'Loja online completa de moda feminina com carrinho de compras, sistema de pagamento e gestão de estoque.',
        challenge: 'Criar uma experiência de compra fluida que converta visitantes em clientes, com carrinho persistente e checkout rápido.',
        solution: 'Desenvolvi um e-commerce moderno com React, incluindo filtros inteligentes, carrinho com LocalStorage, integração com gateway de pagamento e painel administrativo completo.',
        technologies: ['React', 'PHP', 'MySQL', 'Stripe API', 'LocalStorage'],
        results: [
            'Conversão de 2.1% para 4.8%',
            'Aumento de 200% em vendas no primeiro mês',
            'Tempo médio de checkout reduzido em 40%'
        ],
        image: 'https://images.pexels.com/photos/1926769/pexels-photo-1926769.jpeg?auto=compress&cs=tinysrgb&w=1200',
        github: 'https://github.com/seu-usuario/ecommerce-fashion',
        live: 'projetos/ecommerce-fashion/index.html'
    },
    'escola-online': {
        title: 'Escola Online - Plataforma LMS',
        description: 'Plataforma educacional completa com sistema de cursos, certificados e acompanhamento de progresso.',
        challenge: 'Criar uma plataforma que gere engajamento dos alunos, com sistema de progresso visual e certificados automáticos.',
        solution: 'Plataforma LMS desenvolvida com React e Node.js, incluindo vídeos, quizzes interativos, certificados em PDF automáticos e dashboard de progresso em tempo real.',
        technologies: ['React', 'Node.js', 'MongoDB', 'PDF Generation', 'Video Streaming'],
        results: [
            'Taxa de conclusão de cursos: 78%',
            'Aumento de 120% em novos alunos',
            'NPS de 9.2/10'
        ],
        image: 'https://images.pexels.com/photos/5212317/pexels-photo-5212317.jpeg?auto=compress&cs=tinysrgb&w=1200',
        github: 'https://github.com/seu-usuario/escola-online',
        live: 'projetos/escola-online/index.html'
    },
    'imobiliaria-prime': {
        title: 'Imobiliária Prime',
        description: 'Site imobiliário com busca avançada, filtros inteligentes e sistema de favoritos.',
        challenge: 'Facilitar a busca de imóveis com filtros precisos e resultados instantâneos, melhorando a experiência do usuário.',
        solution: 'Sistema de busca em tempo real com múltiplos filtros, mapas interativos, galeria de fotos 360° e sistema de favoritos persistente.',
        technologies: ['JavaScript', 'HTML5', 'CSS3', 'Google Maps API', 'LocalStorage'],
        results: [
            'Tempo de busca reduzido em 60%',
            'Aumento de 85% em contatos qualificados',
            'Taxa de conversão: 12%'
        ],
        image: 'https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=1200',
        github: 'https://github.com/seu-usuario/imobiliaria-prime',
        live: 'projetos/imobiliaria-prime/index.html'
    },
    'restaurante-italiano': {
        title: 'Restaurante Italiano',
        description: 'Site completo para restaurante com cardápio digital, sistema de reservas e gestão de mesas.',
        challenge: 'Criar uma experiência gastronômica online que aumente reservas e mostre o ambiente do restaurante.',
        solution: 'Site desenvolvido com foco na experiência visual, cardápio interativo com filtros por categoria, sistema de reservas em tempo real e integração com redes sociais.',
        technologies: ['PHP', 'MySQL', 'JavaScript', 'Ajax', 'Social Media API'],
        results: [
            'Aumento de 90% em reservas online',
            'Redução de 50% em chamadas telefônicas',
            'Taxa de ocupação aumentou 35%'
        ],
        image: 'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=1200',
        github: 'https://github.com/seu-usuario/restaurante-italiano',
        live: 'projetos/restaurante-italiano/index.html'
    },
    'techsolutions': {
        title: 'TechSolutions - Dashboard Corporativo',
        description: 'Dashboard interativo para empresa de tecnologia com métricas em tempo real e gráficos avançados.',
        challenge: 'Criar uma interface que apresente dados complexos de forma clara e acionável para tomada de decisões.',
        solution: 'Dashboard moderno com visualizações interativas, gráficos em tempo real, métricas de performance e relatórios exportáveis em PDF/Excel.',
        technologies: ['React', 'TypeScript', 'Node.js', 'Chart.js', 'Real-time Data'],
        results: [
            'Tempo de análise de dados reduzido em 70%',
            'Decisões baseadas em dados aumentaram 200%',
            'Adoção pela equipe: 95%'
        ],
        image: 'https://images.pexels.com/photos/1181671/pexels-photo-1181671.jpeg?auto=compress&cs=tinysrgb&w=1200',
        github: 'https://github.com/seu-usuario/techsolutions',
        live: 'projetos/techsolutions/index.html'
    },
    'dcasa-mobile': {
        title: "D'Casa Mobile",
        description: 'Aplicativo mobile para gestão de parceiros, produtos e relatórios em tempo real.',
        challenge: 'Criar um app mobile que permita gestão completa de parceiros e produtos mesmo offline, com sincronização automática.',
        solution: 'Aplicativo React Native com sincronização offline-first, gestão de inventário, relatórios em tempo real e dashboard de analytics integrado.',
        technologies: ['React Native', 'Firebase', 'Redux', 'Offline Storage', 'Push Notifications'],
        results: [
            'Produtividade aumentou 150%',
            'Erros de inventário reduzidos em 80%',
            'Tempo de gestão reduzido em 60%'
        ],
        image: 'https://images.pexels.com/photos/607812/pexels-photo-607812.jpeg?auto=compress&cs=tinysrgb&w=1200',
        github: 'https://github.com/seu-usuario/dcasa-mobile',
        live: 'projetos/dcasa-mobile/index.html'
    }
};

function initProjectModals() {
    // Criar estrutura do modal
    createModalStructure();
    
    // Adicionar eventos aos botões "Ver Projeto"
    document.querySelectorAll('.portfolio-actions .btn-secondary').forEach(btn => {
        btn.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href && href.includes('projetos/')) {
                e.preventDefault();
                
                // Extrair ID do projeto
                const projectId = extractProjectId(href);
                if (projectId && projectDetails[projectId]) {
                    openProjectModal(projectDetails[projectId]);
                } else {
                    // Se não tiver modal, abrir link normalmente
                    window.open(href, '_blank');
                }
            }
        });
    });
}

function extractProjectId(href) {
    const matches = {
        'clinica-psicologica': 'clinica-psicologica',
        'ecommerce-fashion': 'ecommerce-fashion',
        'escola-online': 'escola-online',
        'imobiliaria-prime': 'imobiliaria-prime',
        'restaurante-italiano': 'restaurante-italiano',
        'techsolutions': 'techsolutions',
        'dcasa-mobile': 'dcasa-mobile'
    };
    
    for (const [key, value] of Object.entries(matches)) {
        if (href.includes(value)) {
            return key;
        }
    }
    return null;
}

function createModalStructure() {
    const modalHTML = `
        <div class="project-modal-overlay" id="project-modal-overlay">
            <div class="project-modal" id="project-modal" role="dialog" aria-modal="true" aria-labelledby="project-modal-title">
                <button class="project-modal-close" id="project-modal-close" aria-label="Fechar modal">
                    <i class="fas fa-times"></i>
                </button>
                <div class="project-modal-content" id="project-modal-content">
                    <!-- Conteúdo será inserido dinamicamente -->
                </div>
            </div>
        </div>
    `;
    
    document.body.insertAdjacentHTML('beforeend', modalHTML);
    
    // Event listeners
    document.getElementById('project-modal-close')?.addEventListener('click', closeProjectModal);
    document.getElementById('project-modal-overlay')?.addEventListener('click', function(e) {
        if (e.target === this) closeProjectModal();
    });
    
    // Fechar com ESC
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeProjectModal();
        }
    });
}

function openProjectModal(project) {
    const modal = document.getElementById('project-modal');
    const overlay = document.getElementById('project-modal-overlay');
    const content = document.getElementById('project-modal-content');
    
    if (!modal || !overlay || !content) return;
    
    content.innerHTML = `
        <div class="project-modal-header">
            <img src="${project.image}" alt="${project.title}" class="project-modal-image">
        </div>
        <div class="project-modal-body">
            <h2 id="project-modal-title" class="project-modal-title">${project.title}</h2>
            <p class="project-modal-description">${project.description}</p>
            
            <div class="project-modal-section">
                <h3><i class="fas fa-exclamation-circle"></i> Desafio</h3>
                <p>${project.challenge}</p>
            </div>
            
            <div class="project-modal-section">
                <h3><i class="fas fa-lightbulb"></i> Solução</h3>
                <p>${project.solution}</p>
            </div>
            
            <div class="project-modal-section">
                <h3><i class="fas fa-code"></i> Tecnologias Utilizadas</h3>
                <div class="project-technologies">
                    ${project.technologies.map(tech => `<span class="tech-badge">${tech}</span>`).join('')}
                </div>
            </div>
            
            <div class="project-modal-section">
                <h3><i class="fas fa-chart-line"></i> Resultados</h3>
                <ul class="project-results">
                    ${project.results.map(result => `<li><i class="fas fa-check-circle"></i> ${result}</li>`).join('')}
                </ul>
            </div>
            
            <div class="project-modal-actions">
                <a href="${project.live}" class="btn btn-primary" target="_blank">
                    <i class="fas fa-external-link-alt"></i>
                    Ver Projeto Completo
                </a>
                <a href="${project.github}" class="btn btn-ghost" target="_blank" rel="noopener noreferrer">
                    <i class="fab fa-github"></i>
                    Ver Código no GitHub
                </a>
            </div>
        </div>
    `;
    
    overlay.classList.add('active');
    modal.classList.add('active');
    document.body.style.overflow = 'hidden';
    
    // Focus no modal para acessibilidade
    modal.focus();
}

function closeProjectModal() {
    const modal = document.getElementById('project-modal');
    const overlay = document.getElementById('project-modal-overlay');
    
    if (modal && overlay) {
        overlay.classList.remove('active');
        modal.classList.remove('active');
        document.body.style.overflow = 'auto';
    }
}

// Exportar para uso global
window.initProjectModals = initProjectModals;
window.projectDetails = projectDetails;


