/*
 * opencog/learning/moses/eda/eval-truth_table.cc
 *
 * Copyright (C) 2002-2008 Novamente LLC
 * All Rights Reserved
 *
 * Written by Nil Geisweiller
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

#include <boost/program_options.hpp>
#include <boost/lexical_cast.hpp>

#include <opencog/learning/moses/moses/moses.h>
#include <opencog/learning/moses/moses/scoring_functions.h>

//ant_combo_vocabulary is used only for the boolean core vocabulary
#include <opencog/comboreduct/ant_combo_vocabulary/ant_combo_vocabulary.h>

using namespace boost::program_options;
using boost::lexical_cast;
using namespace moses;
using namespace ant_combo;

int main(int argc,char** argv) { 

    // program options, see options_description below for their meaning
    unsigned long rand_seed;
    string input_table_file;
    string combo_program_str;

    // Declare the supported options.
    options_description desc("Allowed options");
    desc.add_options()
        ("help,h", "produce help message.")
        ("rand-seed,r", value<unsigned long>(&rand_seed)->default_value(1),
         "random seed.")
        ("input-table,i", value<string>(&input_table_file), "input table file")
        ("combo-program,c", value<string>(&combo_program_str),
         "combo program to evaluate against the input table")
        ;

    variables_map vm;
    store(parse_command_line(argc, argv, desc), vm);
    notify(vm);

    if (vm.count("help") || argc == 1) {
        cout << desc << "\n";
        return 1;
    }

    // init random generator
    opencog::MT19937RandGen rng(rand_seed);

    // read input_table_file file
    contin_table_inputs it;
    contin_table ct;
    istreamTable<contin_table_inputs,
                 contin_table, contin_t>(input_table_file, it, ct);

    // read combo program
    combo_tree tr;
    stringstream ss(combo_program_str);
    ss >> tr;

    // evaluated tr over input table
    contin_table ct_tr = contin_table(tr, it, rng);

    cout << "Root mean square error = "
         << ct.root_mean_square_error(ct_tr) << endl;
}
