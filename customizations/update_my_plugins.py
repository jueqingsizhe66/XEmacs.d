try:
    import concurrent.futures as futures
except ImportError:
    try:
        import futures
    except ImportError:
        futures = None

import zipfile
import shutil
import tempfile
import requests

from os import path


#--- Globals ----------------------------------------------
PLUGINS = """
color-rg https://github.com/manateelazycat/color-rg
company-english-helper https://github.com/manateelazycat/company-english-helper
aweshell https://github.com/manateelazycat/aweshell
awesome-pair https://github.com/manateelazycat/awesome-pair
awesome-tab https://github.com/manateelazycat/awesome-tab
org-listcruncher https://github.com/dfeich/org-listcruncher
find-file-in-project https://github.com/technomancy/find-file-in-project
git-timemachine https://github.com/emacsmirror/git-timemachine
Highlight-Indentation-for-Emacs https://github.com/antonj/Highlight-Indentation-for-Emacs
emacs-inertial-scroll https://github.com/kiwanami/emacs-inertial-scroll
counsel-org-clock https://github.com/akirak/counsel-org-clock
emacs-presentation-mode https://github.com/zonuexe/emacs-presentation-mode
fic-mode https://github.com/lewang/fic-mode
thing-edit https://github.com/manateelazycat/thing-edit/
""".strip()


GITHUB_ZIP = '%s/archive/master.zip'

SOURCE_DIR = path.join(path.dirname(__file__), 'my_plugins')


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, 'wb').write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(temp_dir,
                                 path.join(temp_dir, '%s-master' % plugin_name))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print('Updated {0}'.format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(' ')
    zip_path = GITHUB_ZIP % github_url
    download_extract_replace(name, zip_path,
                             temp_directory, SOURCE_DIR)


if __name__ == '__main__':
    temp_directory = tempfile.mkdtemp()

    try:
        if futures:
            with futures.ThreadPoolExecutor(16) as executor:
                executor.map(update, PLUGINS.splitlines())
        else:
            [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
