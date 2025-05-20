# Neurodebian configs
CONFIGS=(
  /etc/fsl/5.0/fsl.sh
  /etc/afni/afni.sh
)
for CONF in $CONFIGS; do if [ -r $CONF ]; then source $CONF; fi; done

# No config, just a path
PATHS=(
  /usr/lib/ants
)
for P in $PATHS; do if [ -d $P ]; then export PATH="$P:$PATH"; fi; done

unsetopt NOMATCH
# FreeSurfer installations
FSHOMES=(
  /usr/local/freesurfer/?.?.?*
  /usr/local/freesurfer
  /Applications/freesurfer  # OSX
  $FREESURFER_HOME          # Could already be defined
)
setopt NOMATCH

for FSHOME in $FSHOMES; do if [ -d $FSHOME ]; then export FREESURFER_HOME=$FSHOME; break; fi; done

FSSUBS=(
  /data/freesurfer/subjects
  $HOME/data/freesurfer/subjects
)

for FS in $FSSUBS; do if [ -d $FS ]; then export SUBJECTS_DIR=$FS; break; fi; done

if [ -n "$FREESURFER_HOME" ]; then
  export FS_FREESURFERENV_NO_OUTPUT=1
  source $FREESURFER_HOME/SetUpFreeSurfer.sh
fi

# FreeSurfer licenses
LICENSES=(
  $FREESURFER_HOME/license.txt		  # Most likely
  $HOME/Documents/work/licenses/freesurfer_license.txt
  $HOME/Documents/freesurfer_license.txt
  $FS_LICENSE                             # Could already be defined
)

for LIC in $LICENSES; do if [ -r $LIC ]; then export FS_LICENSE=$LIC; break; fi; done

AFNI_PATHS=(
  $HOME/abin
)

for AFNI_PATH in $AFNI_PATHS; do
  if [ -d $AFNI_PATH ]; then
    $AFNI_PATH/afni --version &>/dev/null || continue
    export PATH="$AFNI_PATH:$PATH"
    break;
  fi;
done

[[ -f $HOME/.afni/help/all_progs.COMP.zsh ]] && \
  source $HOME/.afni/help/all_progs.COMP.zsh
