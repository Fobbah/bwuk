#include <BWUK/Arbitrator.h>
#include <BWUK/Controller.h>
#include <BWAPI/Unit.h>

namespace BWUK {

	/** Arbitrates the allication of a set of Unit among a set of UnitController */
	typedef Arbitrator< BWAPI::Unit, double > UnitArbitrator;

	/** Bids for control of units with a UnitArbitrator */
	typedef Controller< BWAPI::Unit, double > UnitController;
}
