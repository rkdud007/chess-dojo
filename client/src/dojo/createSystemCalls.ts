import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
    { execute, syncWorker }: SetupNetworkResult,
) {
    const initiate_system = async (game_id: number, white_address: string) => {
        const tx = await execute("initiate_system", [game_id, white_address]);
        syncWorker.sync(tx.transaction_hash);
        console.log("New Game ", game_id)
    };

    const give_up_system = async (game_id: number) => {
        const tx = await execute("give_up_system", [game_id]);
        syncWorker.sync(tx.transaction_hash);
        console.log("Gived up ", game_id)
    };

    const execute_move_system = async (game_id: number, entity_name: number, new_position: {x: number, y: number}) => {
        const tx = await execute("execute_move_system", [game_id, entity_name, new_position]);
        syncWorker.sync(tx.transaction_hash);
        console.log("Moved ", new_position)
    };

    return {
        initiate_system,
        give_up_system,
        execute_move_system
    };
}