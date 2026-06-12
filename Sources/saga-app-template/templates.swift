import Foundation
import HTML
import Saga
import SagaPathKit
import SagaSwimRenderer

private let testFlightURL = "https://testflight.apple.com/join/PKC2gCm3"
private let siteDescription = "A wellness app for teachers — a private space to vent, find perspective, and remember why you started."

func baseHtml(
  title pageTitle: String,
  description: String = siteDescription,
  ogImage: String = "/static/assets/screenshot-home.png",
  @NodeBuilder children: () -> NodeConvertible
) -> Node {
  html(lang: "en-US") {
    head {
      meta(charset: "utf-8")
      meta(content: "width=device-width, initial-scale=1", name: "viewport")
      title { pageTitle }
      meta(content: description, name: "description")
      Node.raw("""
        <meta property="og:title" content="\(pageTitle)">
        <meta property="og:description" content="\(description)">
        <meta property="og:image" content="\(ogImage)">
        <meta property="og:type" content="website">
        <meta name="twitter:card" content="summary_large_image">
        <meta name="twitter:title" content="\(pageTitle)">
        <meta name="twitter:description" content="\(description)">
        <link rel="icon" type="image/png" href="/static/assets/app-icon.png">
      """)
      link(href: Saga.hashed("/static/style.css"), rel: "stylesheet")
    }
    body {
      header(class: "site-header") {
        nav(class: "site-nav") {
          a(class: "site-title", href: "/") {
            img(alt: SiteMetadata.name, class: "nav-icon", src: "/static/assets/app-icon.png")
            SiteMetadata.name
          }
          a(class: "btn-primary btn-sm", href: testFlightURL) { "Test the app" }
        }
      }
      main {
        children()
      }
      footer {
        div(class: "footer-inner") {
          a(href: "/privacy-policy") { "Privacy Policy" }
          a(href: "mailto:nilcamprubi@icloud.com") { "Support" }
          p { "Built with Saga" }
        }
      }
    }
  }
}

// MARK: - Home page

func renderHomePage(context: ItemRenderingContext<EmptyMetadata>) -> Node {
  baseHtml(title: "\(SiteMetadata.name) — For teachers who give everything") {
    heroSection()
    empathySection()
    featuresSection()
    howItWorksSection()
    betaBannerSection()
    faqSection()
  }
}

private func heroSection() -> Node {
  section(class: "hero") {
    div(class: "hero-text") {
      h1(class: "hero-headline") {
        "You give everything to your class."
        br()
        "Solaced gives something "
        span(class: "accent-orange") { "back" }
        " to you."
      }
      p(class: "hero-sub") {
        "Dump your after-class thoughts, receive a warm response, and find real stories from teachers who get it — all in a private space built just for you."
      }
      a(class: "btn-primary", href: testFlightURL) { "Test the app!" }
      p(class: "hero-note") { "Free on TestFlight · iOS · Currently in beta" }
    }
    div(class: "hero-visual") {
      img(
        alt: "Solaced app showing an affirmation for teachers",
        class: "phone-screenshot",
        src: "/static/assets/screenshot-home.png"
      )
    }
  }
}

private func empathySection() -> Node {
  section(class: "empathy") {
    p {
      "Teaching doesn't clock out when you do. The frustrations, the wins nobody claps for, the days you wonder if it's worth it — Solaced is built for all of that."
    }
  }
}

private func featuresSection() -> Node {
  section(class: "features", id: "features") {
    featureCard(
      label: "Remind",
      heading: "On the hard days, we'll remind you why you started",
      body: "Your work shapes people in ways you'll never fully see. Solaced keeps that truth close when it's easy to forget.",
      imageSrc: "/static/assets/screenshot-home.png",
      imageAlt: "App showing an inspiring affirmation for teachers",
      flipped: false
    )
    featureCard(
      label: "Dump",
      heading: "Say it. All of it. Your thoughts stay yours.",
      body: "After a hard class, a rough meeting, or just a day — tap the chat and let it out. Voice or text. No judgment. No one else reads it.",
      imageSrc: "/static/assets/screenshot-talk.png",
      imageAlt: "App chat screen where teachers can share their thoughts",
      flipped: true
    )
    featureCard(
      label: "Inspire",
      heading: "Stories from teachers who've been exactly where you are",
      body: "Curated, real stories from fellow teachers. Not motivational fluff — actual moments from people who understand what your day looks like.",
      imageSrc: "/static/assets/screenshot-response.png",
      imageAlt: "App showing a warm response and suggested teacher stories",
      flipped: false
    )
  }
}

private func featureCard(
  label: String,
  heading: String,
  body: String,
  imageSrc: String,
  imageAlt: String,
  flipped: Bool
) -> Node {
  div(class: flipped ? "feature-card feature-card--flip" : "feature-card") {
    div(class: "feature-screenshot") {
      img(alt: imageAlt, src: imageSrc)
    }
    div(class: "feature-text") {
      span(class: "feature-label") { label }
      h3 { heading }
      p { body }
    }
  }
}

private func howItWorksSection() -> Node {
  section(class: "how-it-works") {
    div(class: "how-it-works-inner") {
      h2 { "How it works" }
      ol(class: "steps") {
        stepItem(
          number: "1",
          title: "Open the app and tap the chat",
          detail: "Your companion is ready whenever you are."
        )
        stepItem(
          number: "2",
          title: "Share what's on your mind",
          detail: "Voice or text — let it out at your own pace."
        )
        stepItem(
          number: "3",
          title: "Receive a warm response and real teacher stories",
          detail: "Feel heard. Find inspiration from those who get it."
        )
      }
    }
  }
}

private func stepItem(number: String, title: String, detail: String) -> Node {
  li(class: "step") {
    span(class: "step-num") { number }
    div(class: "step-text") {
      strong { title }
      p { detail }
    }
  }
}

private func betaBannerSection() -> Node {
  section(class: "beta-banner") {
    div(class: "beta-inner") {
      img(alt: "\(SiteMetadata.name) app icon", class: "beta-icon", src: "/static/assets/app-icon.png")
      div(class: "beta-copy") {
        p(class: "beta-headline") { "\(SiteMetadata.name) is currently in beta." }
        p(class: "beta-body") { "We'd love your honest feedback — the good, the hard, all of it." }
      }
      a(class: "btn-primary btn-orange", href: testFlightURL) { "Test it on TestFlight →" }
    }
  }
}

private func faqSection() -> Node {
  section(class: "faq", id: "faq") {
    h2 { "Common questions" }
    div(class: "faq-list") {
      faqItem(
        question: "What is Solaced?",
        answer: "Solaced is a wellness app made for teachers. It's a space to feel supported, appreciated, and reminded of why your work matters."
      )
      faqItem(
        question: "Is what I write in the app private?",
        answer: "Yes — your thought dumps are for you alone. A safe space to be honest about how you feel, without anyone else reading it."
      )
      faqItem(
        question: "Is Solaced only for struggling teachers?",
        answer: "Not at all. Whether you're having a tough week or just want a daily boost, Solaced is there to support you at any point in your teaching journey."
      )
      faqItem(
        question: "Who is Solaced for?",
        answer: "Educators of all kinds, especially school teachers who could use a little extra motivation, encouragement, or emotional support."
      )
      faqItem(
        question: "How does Solaced help me feel appreciated?",
        answer: "The app sends you gentle reminders of why you teach, how important your role is, and why you should be proud of the work you do every day."
      )
      faqItem(
        question: "What can I do with my after-class thoughts?",
        answer: "Dump them right into the app. Solaced gives you a private space to release your feelings instead of carrying them home with you."
      )
      faqItem(
        question: "Where do the stories in the app come from?",
        answer: "They're curated, real stories shared by fellow teachers — so the inspiration you get comes from people who truly understand your day-to-day."
      )
    }
  }
}

private func faqItem(question: String, answer: String) -> Node {
  div(class: "faq-item") {
    h3 { question }
    p { answer }
  }
}

// MARK: - Page router

func renderPage(context: ItemRenderingContext<EmptyMetadata>) -> Node {
  if context.item.relativeSource.string == "index.md" {
    return renderHomePage(context: context)
  }
  return baseHtml(title: context.item.title) {
    div(class: "page") {
      h1 { context.item.title }
      Node.raw(context.item.body)
    }
  }
}

// MARK: - Article renderers

func renderArticle(context: ItemRenderingContext<ArticleMetadata>) -> Node {
  baseHtml(title: context.item.title) {
    article {
      h1 { context.item.title }
      ul(class: "tags") {
        context.item.metadata.tags.map { tag in
          li {
            a(href: "/articles/tag/\(tag.slugified)/") { tag }
          }
        }
      }
      Node.raw(context.item.body)
    }
  }
}

func renderArticles(context: ItemsRenderingContext<ArticleMetadata>) -> Node {
  baseHtml(title: "Articles") {
    h1 { "Articles" }
    context.items.map { article in
      div(class: "article-card") {
        h2 {
          a(href: article.url) { article.title }
        }
        if let summary = article.metadata.summary {
          p { summary }
        }
      }
    }
  }
}

func renderTag<T>(context: PartitionedRenderingContext<T, ArticleMetadata>) -> Node {
  baseHtml(title: "Articles tagged \(context.key)") {
    h1 { "Articles tagged \(context.key)" }
    context.items.map { article in
      div(class: "article-card") {
        h2 {
          a(href: article.url) { article.title }
        }
      }
    }
  }
}
