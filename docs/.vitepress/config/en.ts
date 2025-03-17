import { defineConfig, type DefaultTheme } from 'vitepress'

export const en = defineConfig({
  lang: 'en-US',
  description: 'Make your app distribution with ease.',

  themeConfig: {
    nav: nav(),

    sidebar: {
      '/': { base: '/', items: sidebarGuide() },
    },

    editLink: {
      pattern:
        'https://github.com/fastforgedev/fastforge/edit/main/docs/:path',
      text: 'Edit this page on GitHub',
    },

    footer: {
      message: 'Released under the MIT License.',
      copyright: 'Copyright © 2021-present LiJianying',
    },
  },
})

function nav(): DefaultTheme.NavItem[] {
  return [
    {
      text: 'Guide',
      link: '/getting-started',
      activeMatch: '/getting-started',
    },
  ]
}

function sidebarGuide(): DefaultTheme.SidebarItem[] {
  return [
    {
      text: 'Guide',
      collapsed: false,
      items: [
        { text: 'Getting Started', link: 'getting-started' },
        { text: 'Distribute Options', link: 'distribute-options' },
        { text: 'CLI', link: 'cli' },
      ],
    },
    {
      text: 'Makers',
      collapsed: false,
      items: [
        { text: 'aab', link: 'makers/aab' },
        { text: 'apk', link: 'makers/apk' },
        { text: 'appimage', link: 'makers/appimage' },
        { text: 'deb', link: 'makers/deb' },
        { text: 'dmg', link: 'makers/dmg' },
        { text: 'exe', link: 'makers/exe' },
        { text: 'ipa', link: 'makers/ipa' },
        { text: 'msix', link: 'makers/msix' },
        { text: 'pkg', link: 'makers/pkg' },
        { text: 'rpm', link: 'makers/rpm' },
        { text: 'zip', link: 'makers/zip' },
      ],
    },
    {
      text: 'Publishers',
      collapsed: false,
      items: [
        { text: 'appcenter', link: 'publishers/appcenter' },
        { text: 'appstore', link: 'publishers/appstore' },
        { text: 'fir', link: 'publishers/fir' },
        {
          text: 'firebase-hosting',
          link: 'publishers/firebase-hosting',
        },
        { text: 'firebase', link: 'publishers/firebase' },
        { text: 'github', link: 'publishers/github' },
        { text: 'pgyer', link: 'publishers/pgyer' },
        { text: 'playstore', link: 'publishers/playstore' },
        { text: 'qiniu', link: 'publishers/qiniu' },
        { text: 'vercel', link: 'publishers/vercel' },
      ],
    },
    {
      text: 'Tools',
      collapsed: false,
      items: [
        {
          text: 'Parse App Package',
          link: 'tools/parse-app-package',
        },
      ],
    },
  ]
}
