# My digital garden

A digital garden made of Markdown notes, running on the
[garden-engine](https://github.com/Chemchu/garden-engine) engine. This repository only holds
the content: the posts, the site settings and a few assets. The engine arrives
as a ready-made image, so there's nothing to compile.

| Path         | What it is                                                      |
| ------------ | --------------------------------------------------------------- |
| `garden/`    | Your posts. `garden/welcome.md` is the home page.               |
| `site.toml`  | Name, links, colors, fonts, corner radius and sections.         |
| `assets/`    | Fonts and any other static files, served under `/_static/`.     |
| `Dockerfile` | Which engine version to run, and how your content goes into it. |
| `fly.toml`   | The Fly.io app this site deploys to.                            |

## Getting it online

You need a GitHub account, a [Fly.io](https://fly.io) account and
[`flyctl`](https://fly.io/docs/flyctl/install/).

1. **Create your repository.** Click "Use this template" on GitHub and make the
   new repository public.
2. **Name your app.** In `fly.toml`, change `app` to a name nobody else uses on
   Fly.io, and pick the `primary_region` closest to you. Set `REPO_SOURCE` to
   `https://github.com/<you>/<your-repo>/blob/main`: posts link to their source
   there, and the admin page opens settings issues in that repository.
3. **Create the Fly app and its deploy token.**

   ```sh
   fly apps create <your-app>
   fly tokens create deploy -a <your-app>
   ```

   In your repository, go to Settings → Secrets and variables → Actions and add
   the token as a secret called `FLY_API_TOKEN`.

4. **Set up the admin account.** It lets you change the look of the site from
   `/admin` without editing files.

   ```sh
   fly secrets set -a <your-app> \
     ADMIN_USERNAME='pick-a-name' \
     ADMIN_PASSWORD='a-long-unique-passphrase' \
     ADMIN_SECRET_KEY="$(openssl rand -hex 32)"
   ```

5. **Let the settings workflow open pull requests.** In your repository, go to
   Settings → Actions → General → Workflow permissions and tick "Allow GitHub
   Actions to create and approve pull requests".
6. **Deploy.** Push to `main`, or run the Deploy workflow from the Actions tab.
   The site goes live at `https://<your-app>.fly.dev`.

## Writing

Add Markdown files under `garden/`. The two guides in `garden/notes/` explain
front matter, tags, drafts, translations and links, and are meant to be
replaced by your own notes.

Every pull request runs the Check workflow. It builds the site and runs
`garden-engine check`, which fails on posts the site would skip and warns about links
that go nowhere. Every push to `main` checks the content again and deploys it.

## Changing the look

Sign in at `/admin` to change the name, description, links, colors, fonts,
corner radius and sections, with a live preview. Saving opens a GitHub issue
that the Site settings workflow turns into a pull request, with any new fonts
downloaded into `assets/fonts/`. Merging it deploys the change.

To use your own favicon, add `assets/favicon.ico`. Files in `assets/` take
precedence over the engine's.

## Optional sections

The chess, music and games pages need accounts on Lichess, Spotify and Steam.
Set their variables with `fly secrets set` and switch the sections on from
`/admin`. Sections without their variables stay hidden. The engine's
[configuration guide](https://github.com/Chemchu/garden-engine/blob/main/docs/CONFIGURATION.md)
lists every variable.

## Previewing locally

With Docker installed:

```sh
docker build -t my-garden .
docker run --rm my-garden ./garden-engine check
docker run --rm -p 3000:3000 \
  -e REPO_SOURCE=https://github.com/<you>/<your-repo>/blob/main \
  my-garden
```

Then open [http://localhost:3000](http://localhost:3000).

## Upgrading the engine

The first line of the `Dockerfile` pins an engine version. Dependabot opens a
pull request when a new one is released. The Check workflow runs on it, and
merging it deploys the new engine with your content.
