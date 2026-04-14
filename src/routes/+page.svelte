<script lang="ts">
  import '../app.css';

  const sites = [
    {
      href: 'https://folio.fizx.uk',
      label: 'folio',
      desc: 'GitHub portfolio generator — paste an npub or username',
      color: 'emerald',
      icon: `<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#34d399" stroke-width="2" stroke-linecap="round">
        <line x1="4" y1="14" x2="4" y2="10"/>
        <line x1="8" y1="18" x2="8" y2="6"/>
        <line x1="12" y1="20" x2="12" y2="4"/>
        <line x1="16" y1="18" x2="16" y2="6"/>
        <line x1="20" y1="14" x2="20" y2="10"/>
      </svg>`,
    },
    {
      href: 'https://pulse.fizx.uk',
      label: 'pulse',
      desc: 'Nostr relay dashboard — real-time relay and event statistics',
      color: 'purple',
      icon: `<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#a78bfa" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <polyline points="3,17 9,11 13,15 21,7"/>
        <polyline points="15,7 21,7 21,13"/>
      </svg>`,
    },
    {
      href: 'https://glimpse.fizx.uk',
      label: 'glimpse',
      desc: 'Satoshi converter — live BTC exchange rates',
      color: 'emerald',
      icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 4" shape-rendering="crispEdges" width="28" height="28">
        <rect x="0" y="0" width="2" height="2" fill="#0d1117"/>
        <rect x="2" y="0" width="2" height="2" fill="#34d399"/>
        <rect x="0" y="2" width="2" height="2" fill="#a78bfa"/>
        <rect x="2" y="2" width="2" height="2" fill="#131d2a"/>
      </svg>`,
    },
    {
      href: 'https://ln.fizx.uk',
      label: 'ln',
      desc: 'Lightning node setup guides',
      color: 'purple',
      icon: `<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="#a78bfa">
        <path d="M13 2L4.5 13.5H11L10 22L20.5 10.5H14L13 2z"/>
      </svg>`,
    },
  ];
</script>

<svelte:head>
  <title>fizx.uk</title>
  <meta name="description" content="Personal web presence of fizx — developer, Bitcoiner, Nostr enthusiast." />
</svelte:head>

<div class="min-h-screen bg-[#0d1117] text-[#f0f6fc] flex flex-col">

  <!-- Nav -->
  <nav class="border-b border-[#1e2d3d] px-6 py-4">
    <div class="max-w-4xl mx-auto flex items-center justify-between">
      <span class="font-mono text-sm text-[#6b7a8d]">fizx.uk</span>
      <div class="flex gap-4 text-sm">
        <a href="https://relay.fizx.uk" target="_blank" rel="noopener"
           class="text-[#6b7a8d] hover:text-[#34d399] transition-colors font-mono">relay</a>
      </div>
    </div>
  </nav>

  <!-- Hero -->
  <main class="flex-1 max-w-4xl mx-auto w-full px-6 py-20">

    <div class="mb-16">
      <h1 class="text-5xl sm:text-6xl font-bold tracking-tight mb-4">
        <span class="bg-gradient-to-r from-[#34d399] via-[#a78bfa] to-[#34d399] bg-clip-text text-transparent">
          fizx
        </span>
        <span class="text-[#f0f6fc]">.uk</span>
      </h1>
      <p class="text-lg text-[#6b7a8d] max-w-xl leading-relaxed">
        Code Assisted Bitcoin &amp; Nostr Projects
      </p>
    </div>

    <!-- Sub-sites grid -->
    <section class="mb-16">
      <h2 class="text-xs font-mono uppercase tracking-widest text-[#6b7a8d] mb-6">
        Projects
      </h2>
      <div class="grid sm:grid-cols-2 gap-4">
        {#each sites as site}
          <a
            href={site.href}
            target="_blank"
            rel="noopener"
            class="group block bg-[#131d2a] border border-[#1e2d3d] rounded-xl p-5
                   hover:border-{site.color === 'emerald' ? '[#34d399]' : '[#a78bfa]'}/50
                   hover:bg-[#1a2535] transition-all duration-200"
            class:hover-emerald={site.color === 'emerald'}
            class:hover-purple={site.color === 'purple'}
          >
            <div class="mb-3">{@html site.icon}</div>
            <div class="flex items-start justify-between mb-2">
              <span class="font-mono font-bold text-lg
                {site.color === 'emerald' ? 'text-[#34d399]' : 'text-[#a78bfa]'}">
                {site.label}<span class="text-[#6b7a8d]">.fizx.uk</span>
              </span>
              <svg class="w-4 h-4 text-[#6b7a8d] group-hover:text-[#f0f6fc] transition-colors mt-1"
                   fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"/>
              </svg>
            </div>
            <p class="text-sm text-[#6b7a8d] leading-relaxed">{site.desc}</p>
          </a>
        {/each}
      </div>
    </section>

    <!-- Identity -->
    <section>
      <h2 class="text-xs font-mono uppercase tracking-widest text-[#6b7a8d] mb-6">
        Find me on
      </h2>
      <div class="flex flex-wrap gap-3">
        <a href="https://github.com/adjmx" target="_blank" rel="noopener"
           class="flex items-center gap-2 bg-[#131d2a] border border-[#1e2d3d] rounded-lg px-4 py-2
                  text-sm text-[#6b7a8d] hover:text-[#34d399] hover:border-[#34d399]/40 transition-all font-mono">
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
            <path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577
                     0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61-.546-1.385-1.335-1.755
                     -1.335-1.755-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236
                     1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466
                     -1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176
                     0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405
                     2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23
                     1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22
                     0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 21.795 24 17.295
                     24 12c0-6.63-5.37-12-12-12"/>
          </svg>
          GitHub
        </a>
        <a href="https://primal.net/p/npub1adjmx" target="_blank" rel="noopener"
           class="flex items-center gap-2 bg-[#131d2a] border border-[#1e2d3d] rounded-lg px-4 py-2
                  text-sm text-[#6b7a8d] hover:text-[#a78bfa] hover:border-[#a78bfa]/40 transition-all font-mono">
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0
                     3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5
                     0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29
                     1.94-3.5 3.22-6 3.22z"/>
          </svg>
          Nostr
        </a>
        <a href="wss://relay.fizx.uk" target="_blank" rel="noopener"
           class="flex items-center gap-2 bg-[#131d2a] border border-[#1e2d3d] rounded-lg px-4 py-2
                  text-sm text-[#6b7a8d] hover:text-[#34d399] hover:border-[#34d399]/40 transition-all font-mono">
          <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M8.111 16.404a5.5 5.5 0 017.778 0M12 20h.01m-7.08-7.071c3.904-3.905
                     10.236-3.905 14.141 0M1.394 9.393c5.857-5.857 15.355-5.857 21.213 0"/>
          </svg>
          relay.fizx.uk
        </a>
      </div>
    </section>

  </main>

  <!-- Footer -->
  <footer class="border-t border-[#1e2d3d] px-6 py-5">
    <div class="max-w-4xl mx-auto flex items-center justify-between text-xs text-[#6b7a8d] font-mono">
      <span>fizx.uk</span>
      <span class="text-[#34d399]/60">✦ built with svelte</span>
    </div>
  </footer>

</div>

<style>
  .hover-emerald:hover {
    border-color: rgb(52 211 153 / 0.4);
  }
  .hover-purple:hover {
    border-color: rgb(167 139 250 / 0.4);
  }
</style>
