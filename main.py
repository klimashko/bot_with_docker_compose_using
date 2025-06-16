import asyncio

from aiogram import Bot, Dispatcher
from aiogram.fsm.storage.redis import RedisStorage

from bot_with_docker_compose_using.config_reader import BotSettings
from bot_with_docker_compose_using.handlers import get_routers


async def main():
    settings = BotSettings()
    bot = Bot(
        token=settings.bot_token.get_secret_value()
    )
    storage = RedisStorage.from_url(str(settings.redis_dsn))
    dp = Dispatcher(storage=storage)
    dp.include_routers(*get_routers())

    print("Starting bot")
    await dp.start_polling(bot)
    print("Bot stopped")

asyncio.run(main())