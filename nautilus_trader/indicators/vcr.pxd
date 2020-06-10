# -------------------------------------------------------------------------------------------------
#  Copyright (C) 2015-2020 Nautech Systems Pty Ltd. All rights reserved.
#  https://nautechsystems.io
#
#  Licensed under the GNU General Public License Version 3.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at https://www.gnu.org/licenses/gpl-3.0.en.html
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# -------------------------------------------------------------------------------------------------

from nautilus_trader.indicators.base.indicator cimport Indicator
from nautilus_trader.indicators.atr cimport AverageTrueRange


cdef class VolatilityCompressionRatio(Indicator):
    cdef int _fast_period
    cdef int _slow_period
    cdef AverageTrueRange _atr_fast
    cdef AverageTrueRange _atr_slow

    cdef readonly double value

    cpdef void update(self, double high, double low, double close)
    cpdef void update_mid(self, double close)
    cdef void _check_initialized(self)
    cpdef void reset(self)