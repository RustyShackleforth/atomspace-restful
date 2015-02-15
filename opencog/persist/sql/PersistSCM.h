/*
 * opencog/persist/sql/PersistSCM.h
 *
 * Copyright (c) 2008 by OpenCog Foundation
 * Copyright (c) 2008, 2009, 2013, 2015 Linas Vepstas <linasvepstas@gmail.com>
 * All Rights Reserved
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License v3 as
 * published by the Free Software Foundation and including the exceptions
 * at http://opencog.org/wiki/Licenses
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program; if not, write to:
 * Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef _OPENCOG_PERSIST_SCM_H
#define _OPENCOG_PERSIST_SCM_H

#include <vector>
#include <string>

#include <opencog/atomspace/AtomSpace.h>
#include <opencog/atomspace/Handle.h>
#include <opencog/persist/sql/AtomStorage.h>

namespace opencog
{
/** \addtogroup grp_persist
 *  @{
 */

class SQLBackingStore;
class PersistSCM
{
private:

	SQLBackingStore *_backing;
	AtomStorage *_store;
	AtomSpace *_as;

	Handle fetch_atom(Handle);
	Handle fetch_incoming_set(Handle);
	Handle store_atom(Handle);
	void load_type(Type);
	void barrier(void);

public:
	PersistSCM(AtomSpace*);
	~PersistSCM();

	void do_open(const std::string&, const std::string&, const std::string&);
	void do_close(void);
	void do_load(void);
	void do_store(void);

}; // class

/** @}*/
}  // namespace

#endif // _OPENCOG_PERSIST_SCM_H
