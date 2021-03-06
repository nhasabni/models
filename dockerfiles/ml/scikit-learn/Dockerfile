# Copyright (c), Intel Corporation
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright notice,
#       this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Intel Corporation nor the names of its contributors
#       may be used to endorse or promote products derived from this software
#       without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

ARG INTEL_PYTHON_TAG=latest
FROM intelpython/intelpython3_core:${INTEL_PYTHON_TAG}

ENV USE_DAAL4PY_SKLEARN YES
ENV MODIN_ENGINE ray

RUN ( apt-get update -y && apt-get autoclean -y && apt-get autoremove -y ) || \
    ( yum update -y && yum clean all -y )

RUN python -m pip install 'ray<=0.8.7'

RUN conda config --add channels intel && \
    conda config --add channels intel/label/oneapibeta && \
    conda install -y -q \
        scikit-learn \
        modin \
        daal4py \
        threadpoolctl && \
    conda clean -y --all

# Fix for this errro: https://github.com/ray-project/ray/issues/6013
RUN sed -i.bak '/include_webui/ s/^#*/#/' /opt/conda/lib/python3.7/site-packages/modin/engines/ray/utils.py

# Test the final container
RUN python -c "import modin.pandas"
