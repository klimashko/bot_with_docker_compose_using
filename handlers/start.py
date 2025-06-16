from aiogram import Router
from aiogram.filters import CommandStart
from aiogram.fsm.context import FSMContext
from aiogram.types import Message

router = Router(name="start-router")


@router.message(CommandStart())
async def cmd_start(message: Message, state: FSMContext):
    data = await state.get_data()
    occurrence = data.get("occurrence", 0)
    if occurrence == 0:
        text = "Привет! Продолжай нажимать /start, а я буду считать."
    else:
        text = f"Количество нажатий /start: {occurrence}. Давай ещё!"
    await message.answer(text)
    await state.update_data(occurrence=occurrence + 1)